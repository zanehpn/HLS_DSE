#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_real_0 "../tv/cdatafile/c.fft.autotvin_real_0.dat"
#define AUTOTB_TVOUT_real_0 "../tv/cdatafile/c.fft.autotvout_real_0.dat"
#define AUTOTB_TVIN_real_1 "../tv/cdatafile/c.fft.autotvin_real_1.dat"
#define AUTOTB_TVOUT_real_1 "../tv/cdatafile/c.fft.autotvout_real_1.dat"
#define AUTOTB_TVIN_img_0 "../tv/cdatafile/c.fft.autotvin_img_0.dat"
#define AUTOTB_TVOUT_img_0 "../tv/cdatafile/c.fft.autotvout_img_0.dat"
#define AUTOTB_TVIN_img_1 "../tv/cdatafile/c.fft.autotvin_img_1.dat"
#define AUTOTB_TVOUT_img_1 "../tv/cdatafile/c.fft.autotvout_img_1.dat"
#define AUTOTB_TVIN_real_twid_0 "../tv/cdatafile/c.fft.autotvin_real_twid_0.dat"
#define AUTOTB_TVOUT_real_twid_0 "../tv/cdatafile/c.fft.autotvout_real_twid_0.dat"
#define AUTOTB_TVIN_real_twid_1 "../tv/cdatafile/c.fft.autotvin_real_twid_1.dat"
#define AUTOTB_TVOUT_real_twid_1 "../tv/cdatafile/c.fft.autotvout_real_twid_1.dat"
#define AUTOTB_TVIN_img_twid_0 "../tv/cdatafile/c.fft.autotvin_img_twid_0.dat"
#define AUTOTB_TVOUT_img_twid_0 "../tv/cdatafile/c.fft.autotvout_img_twid_0.dat"
#define AUTOTB_TVIN_img_twid_1 "../tv/cdatafile/c.fft.autotvin_img_twid_1.dat"
#define AUTOTB_TVOUT_img_twid_1 "../tv/cdatafile/c.fft.autotvout_img_twid_1.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_real_0 "../tv/rtldatafile/rtl.fft.autotvout_real_0.dat"
#define AUTOTB_TVOUT_PC_real_1 "../tv/rtldatafile/rtl.fft.autotvout_real_1.dat"
#define AUTOTB_TVOUT_PC_img_0 "../tv/rtldatafile/rtl.fft.autotvout_img_0.dat"
#define AUTOTB_TVOUT_PC_img_1 "../tv/rtldatafile/rtl.fft.autotvout_img_1.dat"
#define AUTOTB_TVOUT_PC_real_twid_0 "../tv/rtldatafile/rtl.fft.autotvout_real_twid_0.dat"
#define AUTOTB_TVOUT_PC_real_twid_1 "../tv/rtldatafile/rtl.fft.autotvout_real_twid_1.dat"
#define AUTOTB_TVOUT_PC_img_twid_0 "../tv/rtldatafile/rtl.fft.autotvout_img_twid_0.dat"
#define AUTOTB_TVOUT_PC_img_twid_1 "../tv/rtldatafile/rtl.fft.autotvout_img_twid_1.dat"


static const bool little_endian()
{
  int a = 1;
  return *(char*)&a == 1;
}

inline static void rev_endian(char* p, size_t nbytes)
{
  std::reverse(p, p+nbytes);
}

template<size_t bit_width>
struct transaction {
  typedef uint64_t depth_t;
  static const size_t wbytes = (bit_width+7)>>3;
  static const size_t dbytes = sizeof(depth_t);
  const depth_t depth;
  const size_t vbytes;
  const size_t tbytes;
  char * const p;
  typedef char (*p_dat)[wbytes];
  p_dat vp;

  transaction(depth_t depth)
    : depth(depth), vbytes(wbytes*depth), tbytes(dbytes+vbytes),
      p(new char[tbytes]) {
    *(depth_t*)p = depth;
    rev_endian(p, dbytes);
    vp = (p_dat) (p+dbytes);
  }

  void reorder() {
    rev_endian(p, dbytes);
    p_dat vp = (p_dat) (p+dbytes);
    for (depth_t i = 0; i < depth; ++i) {
      rev_endian(vp[i], wbytes);
    }
  }

  template<size_t psize>
  void import(char* param, depth_t num, int64_t offset) {
    param -= offset*psize;
    for (depth_t i = 0; i < num; ++i) {
      memcpy(vp[i], param, wbytes);
      param += psize;
      if (little_endian()) {
        rev_endian(vp[i], wbytes);
      }
    }
    vp += num;
  }

  template<size_t psize>
  void send(char* param, depth_t num) {
    for (depth_t i = 0; i < num; ++i) {
      memcpy(param, vp[i], wbytes);
      param += psize;
    }
    vp += num;
  }

  template<size_t psize>
  void send(char* param, depth_t num, int64_t skip) {
    for (depth_t i = 0; i < num; ++i) {
      memcpy(param, vp[skip+i], wbytes);
      param += psize;
    }
  }

  ~transaction() { if (p) { delete[] p; } }
};


inline static const std::string begin_str(int num)
{
  return std::string("[[transaction]]           ")
         .append(std::to_string(num))
         .append("\n");
}

inline static const std::string end_str()
{
  return std::string("[[/transaction]]\n");
}

const std::string formatData(unsigned char *pos, size_t wbits)
{
  bool LE = little_endian();
  size_t wbytes = (wbits+7)>>3;
  size_t i = LE ? wbytes-1 : 0;
  auto next = [&] () {
    auto c = pos[i];
    LE ? --i : ++i;
    return c;
  };
  std::ostringstream ss;
  ss << "0x";
  if (int t = (wbits & 0x7)) {
    if (t <= 4) {
      unsigned char mask = (1<<t)-1;
      ss << std::hex << std::setfill('0') << std::setw(1)
         << (int) (next() & mask);
      wbytes -= 1;
    }
  }
  for (size_t i = 0; i < wbytes; ++i) {
    ss << std::hex << std::setfill('0') << std::setw(2) << (int)next();
  }
  ss.put('\n');
  return ss.str();
}

static bool RTLOutputCheckAndReplacement(std::string &data)
{
  bool changed = false;
  for (size_t i = 2; i < data.size(); ++i) {
    if (data[i] == 'X' || data[i] == 'x') {
      data[i] = '0';
      changed = true;
    }
  }
  return changed;
}

struct SimException : public std::exception {
  const char *msg;
  const size_t line;
  SimException(const char *msg, const size_t line)
    : msg(msg), line(line)
  {
  }
};

template<size_t bit_width>
class PostCheck
{
  static const char *bad;
  static const char *err;
  std::fstream stream;
  std::string s;

  void send(char *p, ap_uint<bit_width> &data, size_t l, size_t rest)
  {
    if (rest == 0) {
      if (!little_endian()) {
        const size_t wbytes = (bit_width+7)>>3;
        rev_endian(p-wbytes, wbytes);
      }
    } else if (rest < 8) {
      *p = data.range(l+rest-1, l).to_uint();
      send(p+1, data, l+rest, 0);
    } else {
      *p = data.range(l+8-1, l).to_uint();
      send(p+1, data, l+8, rest-8);
    }
  }

  void readline()
  {
    std::getline(stream, s);
    if (stream.eof()) {
      throw SimException(bad, __LINE__);
    }
  }

public:
  char *param;
  size_t psize;
  size_t depth;

  PostCheck(const char *file)
  {
    stream.open(file);
    if (stream.fail()) {
      throw SimException(err, __LINE__);
    } else {
      readline();
      if (s != "[[[runtime]]]") {
        throw SimException(bad, __LINE__);
      }
    }
  }

  ~PostCheck() noexcept(false)
  {
    stream.close();
  }

  void run(size_t AESL_transaction_pc, size_t skip)
  {
    if (stream.peek() == '[') {
      readline();
    }

    for (size_t i = 0; i < skip; ++i) {
      readline();
    }

    bool foundX = false;
    for (size_t i = 0; i < depth; ++i) {
      readline();
      foundX |= RTLOutputCheckAndReplacement(s);
      ap_uint<bit_width> data(s.c_str(), 16);
      send(param+i*psize, data, 0, bit_width);
    }
    if (foundX) {
      std::cerr << "WARNING: [SIM 212-201] RTL produces unknown value "
                << "'x' or 'X' on some port, possible cause: "
                << "There are uninitialized variables in the design.\n";
    }

    if (stream.peek() == '[') {
      readline();
    }
  }
};

template<size_t bit_width>
const char* PostCheck<bit_width>::bad = "Bad TV file";

template<size_t bit_width>
const char* PostCheck<bit_width>::err = "Error on TV file";
      
class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  real_0_depth = 0;
  real_1_depth = 0;
  img_0_depth = 0;
  img_1_depth = 0;
  real_twid_0_depth = 0;
  real_twid_1_depth = 0;
  img_twid_0_depth = 0;
  img_twid_1_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{real_0 " << real_0_depth << "}\n";
  total_list << "{real_1 " << real_1_depth << "}\n";
  total_list << "{img_0 " << img_0_depth << "}\n";
  total_list << "{img_1 " << img_1_depth << "}\n";
  total_list << "{real_twid_0 " << real_twid_0_depth << "}\n";
  total_list << "{real_twid_1 " << real_twid_1_depth << "}\n";
  total_list << "{img_twid_0 " << img_twid_0_depth << "}\n";
  total_list << "{img_twid_1 " << img_twid_1_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int real_0_depth;
    int real_1_depth;
    int img_0_depth;
    int img_1_depth;
    int real_twid_0_depth;
    int real_twid_1_depth;
    int img_twid_0_depth;
    int img_twid_1_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};


struct __cosim_s16__ { char data[16]; };
extern "C" void fft_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_fft_hw(volatile void * __xlx_apatb_param_real_0, volatile void * __xlx_apatb_param_real_1, volatile void * __xlx_apatb_param_img_0, volatile void * __xlx_apatb_param_img_1, volatile void * __xlx_apatb_param_real_twid_0, volatile void * __xlx_apatb_param_real_twid_1, volatile void * __xlx_apatb_param_img_twid_0, volatile void * __xlx_apatb_param_img_twid_1) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
static AESL_FILE_HANDLER aesl_fh;
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;
#ifdef USE_BINARY_TV_FILE
{
transaction<128> tr(256);
aesl_fh.read(AUTOTB_TVOUT_PC_real_0, tr.p, tr.tbytes);
if (little_endian()) { tr.reorder(); }
tr.send<16>((char*)__xlx_apatb_param_real_0, 256);
}
#else
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_real_0);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<128> > real_0_pc_buffer(256);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              real_0_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "real_0" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 256; j < e; j += 1, ++i) {((long long*)__xlx_apatb_param_real_0)[j*2+0] = real_0_pc_buffer[i].range(63,0).to_int64();
((long long*)__xlx_apatb_param_real_0)[j*2+1] = real_0_pc_buffer[i].range(127,64).to_int64();
}}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  #endif
#ifdef USE_BINARY_TV_FILE
{
transaction<128> tr(256);
aesl_fh.read(AUTOTB_TVOUT_PC_real_1, tr.p, tr.tbytes);
if (little_endian()) { tr.reorder(); }
tr.send<16>((char*)__xlx_apatb_param_real_1, 256);
}
#else
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_real_1);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<128> > real_1_pc_buffer(256);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              real_1_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "real_1" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 256; j < e; j += 1, ++i) {((long long*)__xlx_apatb_param_real_1)[j*2+0] = real_1_pc_buffer[i].range(63,0).to_int64();
((long long*)__xlx_apatb_param_real_1)[j*2+1] = real_1_pc_buffer[i].range(127,64).to_int64();
}}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  #endif
#ifdef USE_BINARY_TV_FILE
{
transaction<128> tr(256);
aesl_fh.read(AUTOTB_TVOUT_PC_img_0, tr.p, tr.tbytes);
if (little_endian()) { tr.reorder(); }
tr.send<16>((char*)__xlx_apatb_param_img_0, 256);
}
#else
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_img_0);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<128> > img_0_pc_buffer(256);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              img_0_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "img_0" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 256; j < e; j += 1, ++i) {((long long*)__xlx_apatb_param_img_0)[j*2+0] = img_0_pc_buffer[i].range(63,0).to_int64();
((long long*)__xlx_apatb_param_img_0)[j*2+1] = img_0_pc_buffer[i].range(127,64).to_int64();
}}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  #endif
#ifdef USE_BINARY_TV_FILE
{
transaction<128> tr(256);
aesl_fh.read(AUTOTB_TVOUT_PC_img_1, tr.p, tr.tbytes);
if (little_endian()) { tr.reorder(); }
tr.send<16>((char*)__xlx_apatb_param_img_1, 256);
}
#else
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_img_1);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<128> > img_1_pc_buffer(256);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              img_1_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "img_1" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 256; j < e; j += 1, ++i) {((long long*)__xlx_apatb_param_img_1)[j*2+0] = img_1_pc_buffer[i].range(63,0).to_int64();
((long long*)__xlx_apatb_param_img_1)[j*2+1] = img_1_pc_buffer[i].range(127,64).to_int64();
}}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  #endif

    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_real_0 = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_real_0, 'b');
transaction<128> tr(256);
  __xlx_offset_byte_param_real_0 = 0*16;
  if (__xlx_apatb_param_real_0) {
tr.import<16>((char*)__xlx_apatb_param_real_0, 256, 0);
  }
aesl_fh.write(AUTOTB_TVIN_real_0, tr.p, tr.tbytes);
}

  tcl_file.set_num(256, &tcl_file.real_0_depth);
#else
// print real_0 Transactions
{
aesl_fh.write(AUTOTB_TVIN_real_0, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_real_0 = 0*16;
if (__xlx_apatb_param_real_0) {
for (size_t i = 0; i < 256; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_real_0 + i * 16;
std::string s = formatData(pos, 128);
aesl_fh.write(AUTOTB_TVIN_real_0, s);
}
}
}

  tcl_file.set_num(256, &tcl_file.real_0_depth);
aesl_fh.write(AUTOTB_TVIN_real_0, end_str());
}

#endif
unsigned __xlx_offset_byte_param_real_1 = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_real_1, 'b');
transaction<128> tr(256);
  __xlx_offset_byte_param_real_1 = 0*16;
  if (__xlx_apatb_param_real_1) {
tr.import<16>((char*)__xlx_apatb_param_real_1, 256, 0);
  }
aesl_fh.write(AUTOTB_TVIN_real_1, tr.p, tr.tbytes);
}

  tcl_file.set_num(256, &tcl_file.real_1_depth);
#else
// print real_1 Transactions
{
aesl_fh.write(AUTOTB_TVIN_real_1, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_real_1 = 0*16;
if (__xlx_apatb_param_real_1) {
for (size_t i = 0; i < 256; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_real_1 + i * 16;
std::string s = formatData(pos, 128);
aesl_fh.write(AUTOTB_TVIN_real_1, s);
}
}
}

  tcl_file.set_num(256, &tcl_file.real_1_depth);
aesl_fh.write(AUTOTB_TVIN_real_1, end_str());
}

#endif
unsigned __xlx_offset_byte_param_img_0 = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_img_0, 'b');
transaction<128> tr(256);
  __xlx_offset_byte_param_img_0 = 0*16;
  if (__xlx_apatb_param_img_0) {
tr.import<16>((char*)__xlx_apatb_param_img_0, 256, 0);
  }
aesl_fh.write(AUTOTB_TVIN_img_0, tr.p, tr.tbytes);
}

  tcl_file.set_num(256, &tcl_file.img_0_depth);
#else
// print img_0 Transactions
{
aesl_fh.write(AUTOTB_TVIN_img_0, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_img_0 = 0*16;
if (__xlx_apatb_param_img_0) {
for (size_t i = 0; i < 256; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_img_0 + i * 16;
std::string s = formatData(pos, 128);
aesl_fh.write(AUTOTB_TVIN_img_0, s);
}
}
}

  tcl_file.set_num(256, &tcl_file.img_0_depth);
aesl_fh.write(AUTOTB_TVIN_img_0, end_str());
}

#endif
unsigned __xlx_offset_byte_param_img_1 = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_img_1, 'b');
transaction<128> tr(256);
  __xlx_offset_byte_param_img_1 = 0*16;
  if (__xlx_apatb_param_img_1) {
tr.import<16>((char*)__xlx_apatb_param_img_1, 256, 0);
  }
aesl_fh.write(AUTOTB_TVIN_img_1, tr.p, tr.tbytes);
}

  tcl_file.set_num(256, &tcl_file.img_1_depth);
#else
// print img_1 Transactions
{
aesl_fh.write(AUTOTB_TVIN_img_1, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_img_1 = 0*16;
if (__xlx_apatb_param_img_1) {
for (size_t i = 0; i < 256; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_img_1 + i * 16;
std::string s = formatData(pos, 128);
aesl_fh.write(AUTOTB_TVIN_img_1, s);
}
}
}

  tcl_file.set_num(256, &tcl_file.img_1_depth);
aesl_fh.write(AUTOTB_TVIN_img_1, end_str());
}

#endif
unsigned __xlx_offset_byte_param_real_twid_0 = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_real_twid_0, 'b');
transaction<128> tr(128);
  __xlx_offset_byte_param_real_twid_0 = 0*16;
  if (__xlx_apatb_param_real_twid_0) {
tr.import<16>((char*)__xlx_apatb_param_real_twid_0, 128, 0);
  }
aesl_fh.write(AUTOTB_TVIN_real_twid_0, tr.p, tr.tbytes);
}

  tcl_file.set_num(128, &tcl_file.real_twid_0_depth);
#else
// print real_twid_0 Transactions
{
aesl_fh.write(AUTOTB_TVIN_real_twid_0, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_real_twid_0 = 0*16;
if (__xlx_apatb_param_real_twid_0) {
for (size_t i = 0; i < 128; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_real_twid_0 + i * 16;
std::string s = formatData(pos, 128);
aesl_fh.write(AUTOTB_TVIN_real_twid_0, s);
}
}
}

  tcl_file.set_num(128, &tcl_file.real_twid_0_depth);
aesl_fh.write(AUTOTB_TVIN_real_twid_0, end_str());
}

#endif
unsigned __xlx_offset_byte_param_real_twid_1 = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_real_twid_1, 'b');
transaction<128> tr(128);
  __xlx_offset_byte_param_real_twid_1 = 0*16;
  if (__xlx_apatb_param_real_twid_1) {
tr.import<16>((char*)__xlx_apatb_param_real_twid_1, 128, 0);
  }
aesl_fh.write(AUTOTB_TVIN_real_twid_1, tr.p, tr.tbytes);
}

  tcl_file.set_num(128, &tcl_file.real_twid_1_depth);
#else
// print real_twid_1 Transactions
{
aesl_fh.write(AUTOTB_TVIN_real_twid_1, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_real_twid_1 = 0*16;
if (__xlx_apatb_param_real_twid_1) {
for (size_t i = 0; i < 128; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_real_twid_1 + i * 16;
std::string s = formatData(pos, 128);
aesl_fh.write(AUTOTB_TVIN_real_twid_1, s);
}
}
}

  tcl_file.set_num(128, &tcl_file.real_twid_1_depth);
aesl_fh.write(AUTOTB_TVIN_real_twid_1, end_str());
}

#endif
unsigned __xlx_offset_byte_param_img_twid_0 = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_img_twid_0, 'b');
transaction<128> tr(128);
  __xlx_offset_byte_param_img_twid_0 = 0*16;
  if (__xlx_apatb_param_img_twid_0) {
tr.import<16>((char*)__xlx_apatb_param_img_twid_0, 128, 0);
  }
aesl_fh.write(AUTOTB_TVIN_img_twid_0, tr.p, tr.tbytes);
}

  tcl_file.set_num(128, &tcl_file.img_twid_0_depth);
#else
// print img_twid_0 Transactions
{
aesl_fh.write(AUTOTB_TVIN_img_twid_0, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_img_twid_0 = 0*16;
if (__xlx_apatb_param_img_twid_0) {
for (size_t i = 0; i < 128; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_img_twid_0 + i * 16;
std::string s = formatData(pos, 128);
aesl_fh.write(AUTOTB_TVIN_img_twid_0, s);
}
}
}

  tcl_file.set_num(128, &tcl_file.img_twid_0_depth);
aesl_fh.write(AUTOTB_TVIN_img_twid_0, end_str());
}

#endif
unsigned __xlx_offset_byte_param_img_twid_1 = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_img_twid_1, 'b');
transaction<128> tr(128);
  __xlx_offset_byte_param_img_twid_1 = 0*16;
  if (__xlx_apatb_param_img_twid_1) {
tr.import<16>((char*)__xlx_apatb_param_img_twid_1, 128, 0);
  }
aesl_fh.write(AUTOTB_TVIN_img_twid_1, tr.p, tr.tbytes);
}

  tcl_file.set_num(128, &tcl_file.img_twid_1_depth);
#else
// print img_twid_1 Transactions
{
aesl_fh.write(AUTOTB_TVIN_img_twid_1, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_img_twid_1 = 0*16;
if (__xlx_apatb_param_img_twid_1) {
for (size_t i = 0; i < 128; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_img_twid_1 + i * 16;
std::string s = formatData(pos, 128);
aesl_fh.write(AUTOTB_TVIN_img_twid_1, s);
}
}
}

  tcl_file.set_num(128, &tcl_file.img_twid_1_depth);
aesl_fh.write(AUTOTB_TVIN_img_twid_1, end_str());
}

#endif
CodeState = CALL_C_DUT;
fft_hw_stub_wrapper(__xlx_apatb_param_real_0, __xlx_apatb_param_real_1, __xlx_apatb_param_img_0, __xlx_apatb_param_img_1, __xlx_apatb_param_real_twid_0, __xlx_apatb_param_real_twid_1, __xlx_apatb_param_img_twid_0, __xlx_apatb_param_img_twid_1);
CodeState = DUMP_OUTPUTS;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVOUT_real_0, 'b');
transaction<128> tr(256);
  __xlx_offset_byte_param_real_0 = 0*16;
  if (__xlx_apatb_param_real_0) {
tr.import<16>((char*)__xlx_apatb_param_real_0, 256, 0);
  }
aesl_fh.write(AUTOTB_TVOUT_real_0, tr.p, tr.tbytes);
}

  tcl_file.set_num(256, &tcl_file.real_0_depth);
#else
// print real_0 Transactions
{
aesl_fh.write(AUTOTB_TVOUT_real_0, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_real_0 = 0*16;
if (__xlx_apatb_param_real_0) {
for (size_t i = 0; i < 256; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_real_0 + i * 16;
std::string s = formatData(pos, 128);
aesl_fh.write(AUTOTB_TVOUT_real_0, s);
}
}
}

  tcl_file.set_num(256, &tcl_file.real_0_depth);
aesl_fh.write(AUTOTB_TVOUT_real_0, end_str());
}

#endif
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVOUT_real_1, 'b');
transaction<128> tr(256);
  __xlx_offset_byte_param_real_1 = 0*16;
  if (__xlx_apatb_param_real_1) {
tr.import<16>((char*)__xlx_apatb_param_real_1, 256, 0);
  }
aesl_fh.write(AUTOTB_TVOUT_real_1, tr.p, tr.tbytes);
}

  tcl_file.set_num(256, &tcl_file.real_1_depth);
#else
// print real_1 Transactions
{
aesl_fh.write(AUTOTB_TVOUT_real_1, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_real_1 = 0*16;
if (__xlx_apatb_param_real_1) {
for (size_t i = 0; i < 256; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_real_1 + i * 16;
std::string s = formatData(pos, 128);
aesl_fh.write(AUTOTB_TVOUT_real_1, s);
}
}
}

  tcl_file.set_num(256, &tcl_file.real_1_depth);
aesl_fh.write(AUTOTB_TVOUT_real_1, end_str());
}

#endif
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVOUT_img_0, 'b');
transaction<128> tr(256);
  __xlx_offset_byte_param_img_0 = 0*16;
  if (__xlx_apatb_param_img_0) {
tr.import<16>((char*)__xlx_apatb_param_img_0, 256, 0);
  }
aesl_fh.write(AUTOTB_TVOUT_img_0, tr.p, tr.tbytes);
}

  tcl_file.set_num(256, &tcl_file.img_0_depth);
#else
// print img_0 Transactions
{
aesl_fh.write(AUTOTB_TVOUT_img_0, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_img_0 = 0*16;
if (__xlx_apatb_param_img_0) {
for (size_t i = 0; i < 256; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_img_0 + i * 16;
std::string s = formatData(pos, 128);
aesl_fh.write(AUTOTB_TVOUT_img_0, s);
}
}
}

  tcl_file.set_num(256, &tcl_file.img_0_depth);
aesl_fh.write(AUTOTB_TVOUT_img_0, end_str());
}

#endif
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVOUT_img_1, 'b');
transaction<128> tr(256);
  __xlx_offset_byte_param_img_1 = 0*16;
  if (__xlx_apatb_param_img_1) {
tr.import<16>((char*)__xlx_apatb_param_img_1, 256, 0);
  }
aesl_fh.write(AUTOTB_TVOUT_img_1, tr.p, tr.tbytes);
}

  tcl_file.set_num(256, &tcl_file.img_1_depth);
#else
// print img_1 Transactions
{
aesl_fh.write(AUTOTB_TVOUT_img_1, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_img_1 = 0*16;
if (__xlx_apatb_param_img_1) {
for (size_t i = 0; i < 256; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_img_1 + i * 16;
std::string s = formatData(pos, 128);
aesl_fh.write(AUTOTB_TVOUT_img_1, s);
}
}
}

  tcl_file.set_num(256, &tcl_file.img_1_depth);
aesl_fh.write(AUTOTB_TVOUT_img_1, end_str());
}

#endif
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
