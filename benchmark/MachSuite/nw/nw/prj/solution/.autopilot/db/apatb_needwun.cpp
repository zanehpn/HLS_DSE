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
#define AUTOTB_TVIN_SEQA_0 "../tv/cdatafile/c.needwun.autotvin_SEQA_0.dat"
#define AUTOTB_TVOUT_SEQA_0 "../tv/cdatafile/c.needwun.autotvout_SEQA_0.dat"
#define AUTOTB_TVIN_SEQA_1 "../tv/cdatafile/c.needwun.autotvin_SEQA_1.dat"
#define AUTOTB_TVOUT_SEQA_1 "../tv/cdatafile/c.needwun.autotvout_SEQA_1.dat"
#define AUTOTB_TVIN_SEQB "../tv/cdatafile/c.needwun.autotvin_SEQB.dat"
#define AUTOTB_TVOUT_SEQB "../tv/cdatafile/c.needwun.autotvout_SEQB.dat"
#define AUTOTB_TVIN_alignedA "../tv/cdatafile/c.needwun.autotvin_alignedA.dat"
#define AUTOTB_TVOUT_alignedA "../tv/cdatafile/c.needwun.autotvout_alignedA.dat"
#define AUTOTB_TVIN_alignedB "../tv/cdatafile/c.needwun.autotvin_alignedB.dat"
#define AUTOTB_TVOUT_alignedB "../tv/cdatafile/c.needwun.autotvout_alignedB.dat"
#define AUTOTB_TVIN_M_0 "../tv/cdatafile/c.needwun.autotvin_M_0.dat"
#define AUTOTB_TVOUT_M_0 "../tv/cdatafile/c.needwun.autotvout_M_0.dat"
#define AUTOTB_TVIN_M_1 "../tv/cdatafile/c.needwun.autotvin_M_1.dat"
#define AUTOTB_TVOUT_M_1 "../tv/cdatafile/c.needwun.autotvout_M_1.dat"
#define AUTOTB_TVIN_ptr "../tv/cdatafile/c.needwun.autotvin_ptr.dat"
#define AUTOTB_TVOUT_ptr "../tv/cdatafile/c.needwun.autotvout_ptr.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_SEQA_0 "../tv/rtldatafile/rtl.needwun.autotvout_SEQA_0.dat"
#define AUTOTB_TVOUT_PC_SEQA_1 "../tv/rtldatafile/rtl.needwun.autotvout_SEQA_1.dat"
#define AUTOTB_TVOUT_PC_SEQB "../tv/rtldatafile/rtl.needwun.autotvout_SEQB.dat"
#define AUTOTB_TVOUT_PC_alignedA "../tv/rtldatafile/rtl.needwun.autotvout_alignedA.dat"
#define AUTOTB_TVOUT_PC_alignedB "../tv/rtldatafile/rtl.needwun.autotvout_alignedB.dat"
#define AUTOTB_TVOUT_PC_M_0 "../tv/rtldatafile/rtl.needwun.autotvout_M_0.dat"
#define AUTOTB_TVOUT_PC_M_1 "../tv/rtldatafile/rtl.needwun.autotvout_M_1.dat"
#define AUTOTB_TVOUT_PC_ptr "../tv/rtldatafile/rtl.needwun.autotvout_ptr.dat"


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
  SEQA_0_depth = 0;
  SEQA_1_depth = 0;
  SEQB_depth = 0;
  alignedA_depth = 0;
  alignedB_depth = 0;
  M_0_depth = 0;
  M_1_depth = 0;
  ptr_depth = 0;
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
  total_list << "{SEQA_0 " << SEQA_0_depth << "}\n";
  total_list << "{SEQA_1 " << SEQA_1_depth << "}\n";
  total_list << "{SEQB " << SEQB_depth << "}\n";
  total_list << "{alignedA " << alignedA_depth << "}\n";
  total_list << "{alignedB " << alignedB_depth << "}\n";
  total_list << "{M_0 " << M_0_depth << "}\n";
  total_list << "{M_1 " << M_1_depth << "}\n";
  total_list << "{ptr " << ptr_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int SEQA_0_depth;
    int SEQA_1_depth;
    int SEQB_depth;
    int alignedA_depth;
    int alignedB_depth;
    int M_0_depth;
    int M_1_depth;
    int ptr_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};


extern "C" void needwun_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_needwun_hw(volatile void * __xlx_apatb_param_SEQA_0, volatile void * __xlx_apatb_param_SEQA_1, volatile void * __xlx_apatb_param_SEQB, volatile void * __xlx_apatb_param_alignedA, volatile void * __xlx_apatb_param_alignedB, volatile void * __xlx_apatb_param_M_0, volatile void * __xlx_apatb_param_M_1, volatile void * __xlx_apatb_param_ptr) {
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
transaction<8> tr(256);
aesl_fh.read(AUTOTB_TVOUT_PC_alignedA, tr.p, tr.tbytes);
if (little_endian()) { tr.reorder(); }
tr.send<1>((char*)__xlx_apatb_param_alignedA, 256);
}
#else
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_alignedA);
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
          std::vector<sc_bv<8> > alignedA_pc_buffer(256);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              alignedA_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "alignedA" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 256; j < e; j += 1, ++i) {((char*)__xlx_apatb_param_alignedA)[j*1+0] = alignedA_pc_buffer[i].range(7, 0).to_int64();
}}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  #endif
#ifdef USE_BINARY_TV_FILE
{
transaction<8> tr(256);
aesl_fh.read(AUTOTB_TVOUT_PC_alignedB, tr.p, tr.tbytes);
if (little_endian()) { tr.reorder(); }
tr.send<1>((char*)__xlx_apatb_param_alignedB, 256);
}
#else
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_alignedB);
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
          std::vector<sc_bv<8> > alignedB_pc_buffer(256);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              alignedB_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "alignedB" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 256; j < e; j += 1, ++i) {((char*)__xlx_apatb_param_alignedB)[j*1+0] = alignedB_pc_buffer[i].range(7, 0).to_int64();
}}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  #endif
#ifdef USE_BINARY_TV_FILE
{
transaction<64> tr(4161);
aesl_fh.read(AUTOTB_TVOUT_PC_M_0, tr.p, tr.tbytes);
if (little_endian()) { tr.reorder(); }
tr.send<8>((char*)__xlx_apatb_param_M_0, 4161);
}
#else
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_M_0);
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
          std::vector<sc_bv<64> > M_0_pc_buffer(4161);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              M_0_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "M_0" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 4161; j < e; j += 1, ++i) {((char*)__xlx_apatb_param_M_0)[j*8+0] = M_0_pc_buffer[i].range(7, 0).to_int64();
((char*)__xlx_apatb_param_M_0)[j*8+1] = M_0_pc_buffer[i].range(15, 8).to_int64();
((char*)__xlx_apatb_param_M_0)[j*8+2] = M_0_pc_buffer[i].range(23, 16).to_int64();
((char*)__xlx_apatb_param_M_0)[j*8+3] = M_0_pc_buffer[i].range(31, 24).to_int64();
((char*)__xlx_apatb_param_M_0)[j*8+4] = M_0_pc_buffer[i].range(39, 32).to_int64();
((char*)__xlx_apatb_param_M_0)[j*8+5] = M_0_pc_buffer[i].range(47, 40).to_int64();
((char*)__xlx_apatb_param_M_0)[j*8+6] = M_0_pc_buffer[i].range(55, 48).to_int64();
((char*)__xlx_apatb_param_M_0)[j*8+7] = M_0_pc_buffer[i].range(63, 56).to_int64();
}}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  #endif
#ifdef USE_BINARY_TV_FILE
{
transaction<64> tr(4161);
aesl_fh.read(AUTOTB_TVOUT_PC_M_1, tr.p, tr.tbytes);
if (little_endian()) { tr.reorder(); }
tr.send<8>((char*)__xlx_apatb_param_M_1, 4161);
}
#else
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_M_1);
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
          std::vector<sc_bv<64> > M_1_pc_buffer(4161);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              M_1_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "M_1" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 4161; j < e; j += 1, ++i) {((char*)__xlx_apatb_param_M_1)[j*8+0] = M_1_pc_buffer[i].range(7, 0).to_int64();
((char*)__xlx_apatb_param_M_1)[j*8+1] = M_1_pc_buffer[i].range(15, 8).to_int64();
((char*)__xlx_apatb_param_M_1)[j*8+2] = M_1_pc_buffer[i].range(23, 16).to_int64();
((char*)__xlx_apatb_param_M_1)[j*8+3] = M_1_pc_buffer[i].range(31, 24).to_int64();
((char*)__xlx_apatb_param_M_1)[j*8+4] = M_1_pc_buffer[i].range(39, 32).to_int64();
((char*)__xlx_apatb_param_M_1)[j*8+5] = M_1_pc_buffer[i].range(47, 40).to_int64();
((char*)__xlx_apatb_param_M_1)[j*8+6] = M_1_pc_buffer[i].range(55, 48).to_int64();
((char*)__xlx_apatb_param_M_1)[j*8+7] = M_1_pc_buffer[i].range(63, 56).to_int64();
}}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  #endif
#ifdef USE_BINARY_TV_FILE
{
transaction<16> tr(8321);
aesl_fh.read(AUTOTB_TVOUT_PC_ptr, tr.p, tr.tbytes);
if (little_endian()) { tr.reorder(); }
tr.send<2>((char*)__xlx_apatb_param_ptr, 8321);
}
#else
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_ptr);
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
          std::vector<sc_bv<16> > ptr_pc_buffer(8321);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              ptr_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "ptr" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 8321; j < e; j += 1, ++i) {((char*)__xlx_apatb_param_ptr)[j*2+0] = ptr_pc_buffer[i].range(7, 0).to_int64();
((char*)__xlx_apatb_param_ptr)[j*2+1] = ptr_pc_buffer[i].range(15, 8).to_int64();
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
unsigned __xlx_offset_byte_param_SEQA_0 = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_SEQA_0, 'b');
transaction<16> tr(32);
  __xlx_offset_byte_param_SEQA_0 = 0*2;
  if (__xlx_apatb_param_SEQA_0) {
tr.import<2>((char*)__xlx_apatb_param_SEQA_0, 32, 0);
  }
aesl_fh.write(AUTOTB_TVIN_SEQA_0, tr.p, tr.tbytes);
}

  tcl_file.set_num(32, &tcl_file.SEQA_0_depth);
#else
// print SEQA_0 Transactions
{
aesl_fh.write(AUTOTB_TVIN_SEQA_0, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_SEQA_0 = 0*2;
if (__xlx_apatb_param_SEQA_0) {
for (size_t i = 0; i < 32; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_SEQA_0 + i * 2;
std::string s = formatData(pos, 16);
aesl_fh.write(AUTOTB_TVIN_SEQA_0, s);
}
}
}

  tcl_file.set_num(32, &tcl_file.SEQA_0_depth);
aesl_fh.write(AUTOTB_TVIN_SEQA_0, end_str());
}

#endif
unsigned __xlx_offset_byte_param_SEQA_1 = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_SEQA_1, 'b');
transaction<16> tr(32);
  __xlx_offset_byte_param_SEQA_1 = 0*2;
  if (__xlx_apatb_param_SEQA_1) {
tr.import<2>((char*)__xlx_apatb_param_SEQA_1, 32, 0);
  }
aesl_fh.write(AUTOTB_TVIN_SEQA_1, tr.p, tr.tbytes);
}

  tcl_file.set_num(32, &tcl_file.SEQA_1_depth);
#else
// print SEQA_1 Transactions
{
aesl_fh.write(AUTOTB_TVIN_SEQA_1, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_SEQA_1 = 0*2;
if (__xlx_apatb_param_SEQA_1) {
for (size_t i = 0; i < 32; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_SEQA_1 + i * 2;
std::string s = formatData(pos, 16);
aesl_fh.write(AUTOTB_TVIN_SEQA_1, s);
}
}
}

  tcl_file.set_num(32, &tcl_file.SEQA_1_depth);
aesl_fh.write(AUTOTB_TVIN_SEQA_1, end_str());
}

#endif
unsigned __xlx_offset_byte_param_SEQB = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_SEQB, 'b');
transaction<16> tr(64);
  __xlx_offset_byte_param_SEQB = 0*2;
  if (__xlx_apatb_param_SEQB) {
tr.import<2>((char*)__xlx_apatb_param_SEQB, 64, 0);
  }
aesl_fh.write(AUTOTB_TVIN_SEQB, tr.p, tr.tbytes);
}

  tcl_file.set_num(64, &tcl_file.SEQB_depth);
#else
// print SEQB Transactions
{
aesl_fh.write(AUTOTB_TVIN_SEQB, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_SEQB = 0*2;
if (__xlx_apatb_param_SEQB) {
for (size_t i = 0; i < 64; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_SEQB + i * 2;
std::string s = formatData(pos, 16);
aesl_fh.write(AUTOTB_TVIN_SEQB, s);
}
}
}

  tcl_file.set_num(64, &tcl_file.SEQB_depth);
aesl_fh.write(AUTOTB_TVIN_SEQB, end_str());
}

#endif
unsigned __xlx_offset_byte_param_alignedA = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_alignedA, 'b');
transaction<8> tr(256);
  __xlx_offset_byte_param_alignedA = 0*1;
  if (__xlx_apatb_param_alignedA) {
tr.import<1>((char*)__xlx_apatb_param_alignedA, 256, 0);
  }
aesl_fh.write(AUTOTB_TVIN_alignedA, tr.p, tr.tbytes);
}

  tcl_file.set_num(256, &tcl_file.alignedA_depth);
#else
// print alignedA Transactions
{
aesl_fh.write(AUTOTB_TVIN_alignedA, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_alignedA = 0*1;
if (__xlx_apatb_param_alignedA) {
for (size_t i = 0; i < 256; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_alignedA + i * 1;
std::string s = formatData(pos, 8);
aesl_fh.write(AUTOTB_TVIN_alignedA, s);
}
}
}

  tcl_file.set_num(256, &tcl_file.alignedA_depth);
aesl_fh.write(AUTOTB_TVIN_alignedA, end_str());
}

#endif
unsigned __xlx_offset_byte_param_alignedB = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_alignedB, 'b');
transaction<8> tr(256);
  __xlx_offset_byte_param_alignedB = 0*1;
  if (__xlx_apatb_param_alignedB) {
tr.import<1>((char*)__xlx_apatb_param_alignedB, 256, 0);
  }
aesl_fh.write(AUTOTB_TVIN_alignedB, tr.p, tr.tbytes);
}

  tcl_file.set_num(256, &tcl_file.alignedB_depth);
#else
// print alignedB Transactions
{
aesl_fh.write(AUTOTB_TVIN_alignedB, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_alignedB = 0*1;
if (__xlx_apatb_param_alignedB) {
for (size_t i = 0; i < 256; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_alignedB + i * 1;
std::string s = formatData(pos, 8);
aesl_fh.write(AUTOTB_TVIN_alignedB, s);
}
}
}

  tcl_file.set_num(256, &tcl_file.alignedB_depth);
aesl_fh.write(AUTOTB_TVIN_alignedB, end_str());
}

#endif
unsigned __xlx_offset_byte_param_M_0 = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_M_0, 'b');
transaction<64> tr(4161);
  __xlx_offset_byte_param_M_0 = 0*8;
  if (__xlx_apatb_param_M_0) {
tr.import<8>((char*)__xlx_apatb_param_M_0, 4161, 0);
  }
aesl_fh.write(AUTOTB_TVIN_M_0, tr.p, tr.tbytes);
}

  tcl_file.set_num(4161, &tcl_file.M_0_depth);
#else
// print M_0 Transactions
{
aesl_fh.write(AUTOTB_TVIN_M_0, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_M_0 = 0*8;
if (__xlx_apatb_param_M_0) {
for (size_t i = 0; i < 4161; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_M_0 + i * 8;
std::string s = formatData(pos, 64);
aesl_fh.write(AUTOTB_TVIN_M_0, s);
}
}
}

  tcl_file.set_num(4161, &tcl_file.M_0_depth);
aesl_fh.write(AUTOTB_TVIN_M_0, end_str());
}

#endif
unsigned __xlx_offset_byte_param_M_1 = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_M_1, 'b');
transaction<64> tr(4161);
  __xlx_offset_byte_param_M_1 = 0*8;
  if (__xlx_apatb_param_M_1) {
tr.import<8>((char*)__xlx_apatb_param_M_1, 4161, 0);
  }
aesl_fh.write(AUTOTB_TVIN_M_1, tr.p, tr.tbytes);
}

  tcl_file.set_num(4161, &tcl_file.M_1_depth);
#else
// print M_1 Transactions
{
aesl_fh.write(AUTOTB_TVIN_M_1, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_M_1 = 0*8;
if (__xlx_apatb_param_M_1) {
for (size_t i = 0; i < 4161; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_M_1 + i * 8;
std::string s = formatData(pos, 64);
aesl_fh.write(AUTOTB_TVIN_M_1, s);
}
}
}

  tcl_file.set_num(4161, &tcl_file.M_1_depth);
aesl_fh.write(AUTOTB_TVIN_M_1, end_str());
}

#endif
unsigned __xlx_offset_byte_param_ptr = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_ptr, 'b');
transaction<16> tr(8321);
  __xlx_offset_byte_param_ptr = 0*2;
  if (__xlx_apatb_param_ptr) {
tr.import<2>((char*)__xlx_apatb_param_ptr, 8321, 0);
  }
aesl_fh.write(AUTOTB_TVIN_ptr, tr.p, tr.tbytes);
}

  tcl_file.set_num(8321, &tcl_file.ptr_depth);
#else
// print ptr Transactions
{
aesl_fh.write(AUTOTB_TVIN_ptr, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_ptr = 0*2;
if (__xlx_apatb_param_ptr) {
for (size_t i = 0; i < 8321; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_ptr + i * 2;
std::string s = formatData(pos, 16);
aesl_fh.write(AUTOTB_TVIN_ptr, s);
}
}
}

  tcl_file.set_num(8321, &tcl_file.ptr_depth);
aesl_fh.write(AUTOTB_TVIN_ptr, end_str());
}

#endif
CodeState = CALL_C_DUT;
needwun_hw_stub_wrapper(__xlx_apatb_param_SEQA_0, __xlx_apatb_param_SEQA_1, __xlx_apatb_param_SEQB, __xlx_apatb_param_alignedA, __xlx_apatb_param_alignedB, __xlx_apatb_param_M_0, __xlx_apatb_param_M_1, __xlx_apatb_param_ptr);
CodeState = DUMP_OUTPUTS;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVOUT_alignedA, 'b');
transaction<8> tr(256);
  __xlx_offset_byte_param_alignedA = 0*1;
  if (__xlx_apatb_param_alignedA) {
tr.import<1>((char*)__xlx_apatb_param_alignedA, 256, 0);
  }
aesl_fh.write(AUTOTB_TVOUT_alignedA, tr.p, tr.tbytes);
}

  tcl_file.set_num(256, &tcl_file.alignedA_depth);
#else
// print alignedA Transactions
{
aesl_fh.write(AUTOTB_TVOUT_alignedA, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_alignedA = 0*1;
if (__xlx_apatb_param_alignedA) {
for (size_t i = 0; i < 256; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_alignedA + i * 1;
std::string s = formatData(pos, 8);
aesl_fh.write(AUTOTB_TVOUT_alignedA, s);
}
}
}

  tcl_file.set_num(256, &tcl_file.alignedA_depth);
aesl_fh.write(AUTOTB_TVOUT_alignedA, end_str());
}

#endif
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVOUT_alignedB, 'b');
transaction<8> tr(256);
  __xlx_offset_byte_param_alignedB = 0*1;
  if (__xlx_apatb_param_alignedB) {
tr.import<1>((char*)__xlx_apatb_param_alignedB, 256, 0);
  }
aesl_fh.write(AUTOTB_TVOUT_alignedB, tr.p, tr.tbytes);
}

  tcl_file.set_num(256, &tcl_file.alignedB_depth);
#else
// print alignedB Transactions
{
aesl_fh.write(AUTOTB_TVOUT_alignedB, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_alignedB = 0*1;
if (__xlx_apatb_param_alignedB) {
for (size_t i = 0; i < 256; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_alignedB + i * 1;
std::string s = formatData(pos, 8);
aesl_fh.write(AUTOTB_TVOUT_alignedB, s);
}
}
}

  tcl_file.set_num(256, &tcl_file.alignedB_depth);
aesl_fh.write(AUTOTB_TVOUT_alignedB, end_str());
}

#endif
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVOUT_M_0, 'b');
transaction<64> tr(4161);
  __xlx_offset_byte_param_M_0 = 0*8;
  if (__xlx_apatb_param_M_0) {
tr.import<8>((char*)__xlx_apatb_param_M_0, 4161, 0);
  }
aesl_fh.write(AUTOTB_TVOUT_M_0, tr.p, tr.tbytes);
}

  tcl_file.set_num(4161, &tcl_file.M_0_depth);
#else
// print M_0 Transactions
{
aesl_fh.write(AUTOTB_TVOUT_M_0, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_M_0 = 0*8;
if (__xlx_apatb_param_M_0) {
for (size_t i = 0; i < 4161; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_M_0 + i * 8;
std::string s = formatData(pos, 64);
aesl_fh.write(AUTOTB_TVOUT_M_0, s);
}
}
}

  tcl_file.set_num(4161, &tcl_file.M_0_depth);
aesl_fh.write(AUTOTB_TVOUT_M_0, end_str());
}

#endif
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVOUT_M_1, 'b');
transaction<64> tr(4161);
  __xlx_offset_byte_param_M_1 = 0*8;
  if (__xlx_apatb_param_M_1) {
tr.import<8>((char*)__xlx_apatb_param_M_1, 4161, 0);
  }
aesl_fh.write(AUTOTB_TVOUT_M_1, tr.p, tr.tbytes);
}

  tcl_file.set_num(4161, &tcl_file.M_1_depth);
#else
// print M_1 Transactions
{
aesl_fh.write(AUTOTB_TVOUT_M_1, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_M_1 = 0*8;
if (__xlx_apatb_param_M_1) {
for (size_t i = 0; i < 4161; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_M_1 + i * 8;
std::string s = formatData(pos, 64);
aesl_fh.write(AUTOTB_TVOUT_M_1, s);
}
}
}

  tcl_file.set_num(4161, &tcl_file.M_1_depth);
aesl_fh.write(AUTOTB_TVOUT_M_1, end_str());
}

#endif
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVOUT_ptr, 'b');
transaction<16> tr(8321);
  __xlx_offset_byte_param_ptr = 0*2;
  if (__xlx_apatb_param_ptr) {
tr.import<2>((char*)__xlx_apatb_param_ptr, 8321, 0);
  }
aesl_fh.write(AUTOTB_TVOUT_ptr, tr.p, tr.tbytes);
}

  tcl_file.set_num(8321, &tcl_file.ptr_depth);
#else
// print ptr Transactions
{
aesl_fh.write(AUTOTB_TVOUT_ptr, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_ptr = 0*2;
if (__xlx_apatb_param_ptr) {
for (size_t i = 0; i < 8321; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_ptr + i * 2;
std::string s = formatData(pos, 16);
aesl_fh.write(AUTOTB_TVOUT_ptr, s);
}
}
}

  tcl_file.set_num(8321, &tcl_file.ptr_depth);
aesl_fh.write(AUTOTB_TVOUT_ptr, end_str());
}

#endif
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
