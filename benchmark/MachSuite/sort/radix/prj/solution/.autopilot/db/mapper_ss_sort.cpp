#include <systemc>
#include <list>
#include <map>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;

namespace bcsim
{
  struct Buffer {
    char *first;
    Buffer(char *addr) : first(addr)
    {
    }
  };

  struct DBuffer : public Buffer {
    size_t ufree;

    DBuffer(size_t usize) : Buffer(nullptr), ufree(1<<10)
    {
      first = new char[usize*ufree];
    }

    ~DBuffer()
    {
      delete[] first;
    }
  };

  struct CStream {
    char *front;
    char *back;
    size_t num;
    size_t usize;
    std::list<Buffer*> bufs;
    bool dynamic;

    CStream() : front(nullptr), back(nullptr),
                num(0), usize(0), dynamic(true)
    {
    }

    ~CStream()
    {
      for (Buffer *p : bufs) {
        delete p;
      }
    }

    template<typename T>
    T* data()
    {
      return (T*)front;
    }

    template<typename T>
    void transfer(hls::stream<T> *param)
    {
      while (!empty()) {
        param->write(*(T*)nextRead());
      }
    }

    bool empty();
    char* nextRead();
    char* nextWrite();
  };

  bool CStream::empty()
  {
    return num == 0;
  }

  char* CStream::nextRead()
  {
    assert(num > 0);
    char *res = front;
    front += usize;
    --num;
    return res;
  }

  char* CStream::nextWrite()
  {
    if (dynamic) {
      if (static_cast<DBuffer*>(bufs.back())->ufree == 0) {
        bufs.push_back(new DBuffer(usize));
        back = bufs.back()->first;
      }
      --static_cast<DBuffer*>(bufs.back())->ufree;
    }
    char *res = back;
    back += usize;
    ++num;
    return res;
  }

  std::list<CStream> streams;
  std::map<char*, CStream*> prebuilt;

  CStream* createStream(size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = true;
      s.bufs.push_back(new DBuffer(usize));
      s.front = s.bufs.back()->first;
      s.back = s.front;
      s.num = 0;
      s.usize = usize;
    }
    return &s;
  }

  template<typename T>
  CStream* createStream(hls::stream<T> *param)
  {
    CStream *s = createStream(sizeof(T));
    {
      s->dynamic = true;
      while (!param->empty()) {
        T data = param->read();
        memcpy(s->nextWrite(), (char*)&data, sizeof(T));
      }
      prebuilt[s->front] = s;
    }
    return s;
  }

  template<typename T>
  CStream* createStream(T *param, size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = false;
      s.bufs.push_back(new Buffer((char*)param));
      s.front = s.back = s.bufs.back()->first;
      s.usize = usize;
      s.num = ~0UL;
    }
    prebuilt[s.front] = &s;
    return &s;
  }

  CStream* findStream(char *buf)
  {
    return prebuilt.at(buf);
  }
}
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
extern "C" void ss_sort(long long*, long long*, long long*, long long*, long long*, long long*, long long*, long long*);
extern "C" void apatb_ss_sort_hw(volatile void * __xlx_apatb_param_a_0, volatile void * __xlx_apatb_param_a_1, volatile void * __xlx_apatb_param_b_0, volatile void * __xlx_apatb_param_b_1, volatile void * __xlx_apatb_param_bucket_0, volatile void * __xlx_apatb_param_bucket_1, volatile void * __xlx_apatb_param_sum_0, volatile void * __xlx_apatb_param_sum_1) {
  // Collect __xlx_a_0__tmp_vec
  vector<sc_bv<64> >__xlx_a_0__tmp_vec;
  for (int j = 0, e = 512; j != e; ++j) {
    sc_bv<64> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_a_0)[j*8+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_a_0)[j*8+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_a_0)[j*8+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_a_0)[j*8+3];
    _xlx_tmp_sc.range(39, 32) = ((char*)__xlx_apatb_param_a_0)[j*8+4];
    _xlx_tmp_sc.range(47, 40) = ((char*)__xlx_apatb_param_a_0)[j*8+5];
    _xlx_tmp_sc.range(55, 48) = ((char*)__xlx_apatb_param_a_0)[j*8+6];
    _xlx_tmp_sc.range(63, 56) = ((char*)__xlx_apatb_param_a_0)[j*8+7];
    __xlx_a_0__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_a_0 = 512;
  int __xlx_offset_param_a_0 = 0;
  int __xlx_offset_byte_param_a_0 = 0*8;
  long long* __xlx_a_0__input_buffer= new long long[__xlx_a_0__tmp_vec.size()];
  for (int i = 0; i < __xlx_a_0__tmp_vec.size(); ++i) {
    __xlx_a_0__input_buffer[i] = __xlx_a_0__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_a_1__tmp_vec
  vector<sc_bv<64> >__xlx_a_1__tmp_vec;
  for (int j = 0, e = 512; j != e; ++j) {
    sc_bv<64> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_a_1)[j*8+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_a_1)[j*8+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_a_1)[j*8+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_a_1)[j*8+3];
    _xlx_tmp_sc.range(39, 32) = ((char*)__xlx_apatb_param_a_1)[j*8+4];
    _xlx_tmp_sc.range(47, 40) = ((char*)__xlx_apatb_param_a_1)[j*8+5];
    _xlx_tmp_sc.range(55, 48) = ((char*)__xlx_apatb_param_a_1)[j*8+6];
    _xlx_tmp_sc.range(63, 56) = ((char*)__xlx_apatb_param_a_1)[j*8+7];
    __xlx_a_1__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_a_1 = 512;
  int __xlx_offset_param_a_1 = 0;
  int __xlx_offset_byte_param_a_1 = 0*8;
  long long* __xlx_a_1__input_buffer= new long long[__xlx_a_1__tmp_vec.size()];
  for (int i = 0; i < __xlx_a_1__tmp_vec.size(); ++i) {
    __xlx_a_1__input_buffer[i] = __xlx_a_1__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_b_0__tmp_vec
  vector<sc_bv<64> >__xlx_b_0__tmp_vec;
  for (int j = 0, e = 512; j != e; ++j) {
    sc_bv<64> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_b_0)[j*8+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_b_0)[j*8+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_b_0)[j*8+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_b_0)[j*8+3];
    _xlx_tmp_sc.range(39, 32) = ((char*)__xlx_apatb_param_b_0)[j*8+4];
    _xlx_tmp_sc.range(47, 40) = ((char*)__xlx_apatb_param_b_0)[j*8+5];
    _xlx_tmp_sc.range(55, 48) = ((char*)__xlx_apatb_param_b_0)[j*8+6];
    _xlx_tmp_sc.range(63, 56) = ((char*)__xlx_apatb_param_b_0)[j*8+7];
    __xlx_b_0__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_b_0 = 512;
  int __xlx_offset_param_b_0 = 0;
  int __xlx_offset_byte_param_b_0 = 0*8;
  long long* __xlx_b_0__input_buffer= new long long[__xlx_b_0__tmp_vec.size()];
  for (int i = 0; i < __xlx_b_0__tmp_vec.size(); ++i) {
    __xlx_b_0__input_buffer[i] = __xlx_b_0__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_b_1__tmp_vec
  vector<sc_bv<64> >__xlx_b_1__tmp_vec;
  for (int j = 0, e = 512; j != e; ++j) {
    sc_bv<64> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_b_1)[j*8+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_b_1)[j*8+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_b_1)[j*8+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_b_1)[j*8+3];
    _xlx_tmp_sc.range(39, 32) = ((char*)__xlx_apatb_param_b_1)[j*8+4];
    _xlx_tmp_sc.range(47, 40) = ((char*)__xlx_apatb_param_b_1)[j*8+5];
    _xlx_tmp_sc.range(55, 48) = ((char*)__xlx_apatb_param_b_1)[j*8+6];
    _xlx_tmp_sc.range(63, 56) = ((char*)__xlx_apatb_param_b_1)[j*8+7];
    __xlx_b_1__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_b_1 = 512;
  int __xlx_offset_param_b_1 = 0;
  int __xlx_offset_byte_param_b_1 = 0*8;
  long long* __xlx_b_1__input_buffer= new long long[__xlx_b_1__tmp_vec.size()];
  for (int i = 0; i < __xlx_b_1__tmp_vec.size(); ++i) {
    __xlx_b_1__input_buffer[i] = __xlx_b_1__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_bucket_0__tmp_vec
  vector<sc_bv<64> >__xlx_bucket_0__tmp_vec;
  for (int j = 0, e = 512; j != e; ++j) {
    sc_bv<64> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_bucket_0)[j*8+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_bucket_0)[j*8+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_bucket_0)[j*8+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_bucket_0)[j*8+3];
    _xlx_tmp_sc.range(39, 32) = ((char*)__xlx_apatb_param_bucket_0)[j*8+4];
    _xlx_tmp_sc.range(47, 40) = ((char*)__xlx_apatb_param_bucket_0)[j*8+5];
    _xlx_tmp_sc.range(55, 48) = ((char*)__xlx_apatb_param_bucket_0)[j*8+6];
    _xlx_tmp_sc.range(63, 56) = ((char*)__xlx_apatb_param_bucket_0)[j*8+7];
    __xlx_bucket_0__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_bucket_0 = 512;
  int __xlx_offset_param_bucket_0 = 0;
  int __xlx_offset_byte_param_bucket_0 = 0*8;
  long long* __xlx_bucket_0__input_buffer= new long long[__xlx_bucket_0__tmp_vec.size()];
  for (int i = 0; i < __xlx_bucket_0__tmp_vec.size(); ++i) {
    __xlx_bucket_0__input_buffer[i] = __xlx_bucket_0__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_bucket_1__tmp_vec
  vector<sc_bv<64> >__xlx_bucket_1__tmp_vec;
  for (int j = 0, e = 512; j != e; ++j) {
    sc_bv<64> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_bucket_1)[j*8+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_bucket_1)[j*8+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_bucket_1)[j*8+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_bucket_1)[j*8+3];
    _xlx_tmp_sc.range(39, 32) = ((char*)__xlx_apatb_param_bucket_1)[j*8+4];
    _xlx_tmp_sc.range(47, 40) = ((char*)__xlx_apatb_param_bucket_1)[j*8+5];
    _xlx_tmp_sc.range(55, 48) = ((char*)__xlx_apatb_param_bucket_1)[j*8+6];
    _xlx_tmp_sc.range(63, 56) = ((char*)__xlx_apatb_param_bucket_1)[j*8+7];
    __xlx_bucket_1__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_bucket_1 = 512;
  int __xlx_offset_param_bucket_1 = 0;
  int __xlx_offset_byte_param_bucket_1 = 0*8;
  long long* __xlx_bucket_1__input_buffer= new long long[__xlx_bucket_1__tmp_vec.size()];
  for (int i = 0; i < __xlx_bucket_1__tmp_vec.size(); ++i) {
    __xlx_bucket_1__input_buffer[i] = __xlx_bucket_1__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_sum_0__tmp_vec
  vector<sc_bv<64> >__xlx_sum_0__tmp_vec;
  for (int j = 0, e = 32; j != e; ++j) {
    sc_bv<64> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_sum_0)[j*8+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_sum_0)[j*8+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_sum_0)[j*8+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_sum_0)[j*8+3];
    _xlx_tmp_sc.range(39, 32) = ((char*)__xlx_apatb_param_sum_0)[j*8+4];
    _xlx_tmp_sc.range(47, 40) = ((char*)__xlx_apatb_param_sum_0)[j*8+5];
    _xlx_tmp_sc.range(55, 48) = ((char*)__xlx_apatb_param_sum_0)[j*8+6];
    _xlx_tmp_sc.range(63, 56) = ((char*)__xlx_apatb_param_sum_0)[j*8+7];
    __xlx_sum_0__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_sum_0 = 32;
  int __xlx_offset_param_sum_0 = 0;
  int __xlx_offset_byte_param_sum_0 = 0*8;
  long long* __xlx_sum_0__input_buffer= new long long[__xlx_sum_0__tmp_vec.size()];
  for (int i = 0; i < __xlx_sum_0__tmp_vec.size(); ++i) {
    __xlx_sum_0__input_buffer[i] = __xlx_sum_0__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_sum_1__tmp_vec
  vector<sc_bv<64> >__xlx_sum_1__tmp_vec;
  for (int j = 0, e = 32; j != e; ++j) {
    sc_bv<64> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_sum_1)[j*8+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_sum_1)[j*8+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_sum_1)[j*8+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_sum_1)[j*8+3];
    _xlx_tmp_sc.range(39, 32) = ((char*)__xlx_apatb_param_sum_1)[j*8+4];
    _xlx_tmp_sc.range(47, 40) = ((char*)__xlx_apatb_param_sum_1)[j*8+5];
    _xlx_tmp_sc.range(55, 48) = ((char*)__xlx_apatb_param_sum_1)[j*8+6];
    _xlx_tmp_sc.range(63, 56) = ((char*)__xlx_apatb_param_sum_1)[j*8+7];
    __xlx_sum_1__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_sum_1 = 32;
  int __xlx_offset_param_sum_1 = 0;
  int __xlx_offset_byte_param_sum_1 = 0*8;
  long long* __xlx_sum_1__input_buffer= new long long[__xlx_sum_1__tmp_vec.size()];
  for (int i = 0; i < __xlx_sum_1__tmp_vec.size(); ++i) {
    __xlx_sum_1__input_buffer[i] = __xlx_sum_1__tmp_vec[i].range(63, 0).to_uint64();
  }
  // DUT call
  ss_sort(__xlx_a_0__input_buffer, __xlx_a_1__input_buffer, __xlx_b_0__input_buffer, __xlx_b_1__input_buffer, __xlx_bucket_0__input_buffer, __xlx_bucket_1__input_buffer, __xlx_sum_0__input_buffer, __xlx_sum_1__input_buffer);
// print __xlx_apatb_param_a_0
  sc_bv<64>*__xlx_a_0_output_buffer = new sc_bv<64>[__xlx_size_param_a_0];
  for (int i = 0; i < __xlx_size_param_a_0; ++i) {
    __xlx_a_0_output_buffer[i] = __xlx_a_0__input_buffer[i+__xlx_offset_param_a_0];
  }
  for (int i = 0; i < __xlx_size_param_a_0; ++i) {
    ((char*)__xlx_apatb_param_a_0)[i*8+0] = __xlx_a_0_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_a_0)[i*8+1] = __xlx_a_0_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_a_0)[i*8+2] = __xlx_a_0_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_a_0)[i*8+3] = __xlx_a_0_output_buffer[i].range(31, 24).to_uint();
    ((char*)__xlx_apatb_param_a_0)[i*8+4] = __xlx_a_0_output_buffer[i].range(39, 32).to_uint();
    ((char*)__xlx_apatb_param_a_0)[i*8+5] = __xlx_a_0_output_buffer[i].range(47, 40).to_uint();
    ((char*)__xlx_apatb_param_a_0)[i*8+6] = __xlx_a_0_output_buffer[i].range(55, 48).to_uint();
    ((char*)__xlx_apatb_param_a_0)[i*8+7] = __xlx_a_0_output_buffer[i].range(63, 56).to_uint();
  }
// print __xlx_apatb_param_a_1
  sc_bv<64>*__xlx_a_1_output_buffer = new sc_bv<64>[__xlx_size_param_a_1];
  for (int i = 0; i < __xlx_size_param_a_1; ++i) {
    __xlx_a_1_output_buffer[i] = __xlx_a_1__input_buffer[i+__xlx_offset_param_a_1];
  }
  for (int i = 0; i < __xlx_size_param_a_1; ++i) {
    ((char*)__xlx_apatb_param_a_1)[i*8+0] = __xlx_a_1_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_a_1)[i*8+1] = __xlx_a_1_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_a_1)[i*8+2] = __xlx_a_1_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_a_1)[i*8+3] = __xlx_a_1_output_buffer[i].range(31, 24).to_uint();
    ((char*)__xlx_apatb_param_a_1)[i*8+4] = __xlx_a_1_output_buffer[i].range(39, 32).to_uint();
    ((char*)__xlx_apatb_param_a_1)[i*8+5] = __xlx_a_1_output_buffer[i].range(47, 40).to_uint();
    ((char*)__xlx_apatb_param_a_1)[i*8+6] = __xlx_a_1_output_buffer[i].range(55, 48).to_uint();
    ((char*)__xlx_apatb_param_a_1)[i*8+7] = __xlx_a_1_output_buffer[i].range(63, 56).to_uint();
  }
// print __xlx_apatb_param_b_0
  sc_bv<64>*__xlx_b_0_output_buffer = new sc_bv<64>[__xlx_size_param_b_0];
  for (int i = 0; i < __xlx_size_param_b_0; ++i) {
    __xlx_b_0_output_buffer[i] = __xlx_b_0__input_buffer[i+__xlx_offset_param_b_0];
  }
  for (int i = 0; i < __xlx_size_param_b_0; ++i) {
    ((char*)__xlx_apatb_param_b_0)[i*8+0] = __xlx_b_0_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_b_0)[i*8+1] = __xlx_b_0_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_b_0)[i*8+2] = __xlx_b_0_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_b_0)[i*8+3] = __xlx_b_0_output_buffer[i].range(31, 24).to_uint();
    ((char*)__xlx_apatb_param_b_0)[i*8+4] = __xlx_b_0_output_buffer[i].range(39, 32).to_uint();
    ((char*)__xlx_apatb_param_b_0)[i*8+5] = __xlx_b_0_output_buffer[i].range(47, 40).to_uint();
    ((char*)__xlx_apatb_param_b_0)[i*8+6] = __xlx_b_0_output_buffer[i].range(55, 48).to_uint();
    ((char*)__xlx_apatb_param_b_0)[i*8+7] = __xlx_b_0_output_buffer[i].range(63, 56).to_uint();
  }
// print __xlx_apatb_param_b_1
  sc_bv<64>*__xlx_b_1_output_buffer = new sc_bv<64>[__xlx_size_param_b_1];
  for (int i = 0; i < __xlx_size_param_b_1; ++i) {
    __xlx_b_1_output_buffer[i] = __xlx_b_1__input_buffer[i+__xlx_offset_param_b_1];
  }
  for (int i = 0; i < __xlx_size_param_b_1; ++i) {
    ((char*)__xlx_apatb_param_b_1)[i*8+0] = __xlx_b_1_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_b_1)[i*8+1] = __xlx_b_1_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_b_1)[i*8+2] = __xlx_b_1_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_b_1)[i*8+3] = __xlx_b_1_output_buffer[i].range(31, 24).to_uint();
    ((char*)__xlx_apatb_param_b_1)[i*8+4] = __xlx_b_1_output_buffer[i].range(39, 32).to_uint();
    ((char*)__xlx_apatb_param_b_1)[i*8+5] = __xlx_b_1_output_buffer[i].range(47, 40).to_uint();
    ((char*)__xlx_apatb_param_b_1)[i*8+6] = __xlx_b_1_output_buffer[i].range(55, 48).to_uint();
    ((char*)__xlx_apatb_param_b_1)[i*8+7] = __xlx_b_1_output_buffer[i].range(63, 56).to_uint();
  }
// print __xlx_apatb_param_bucket_0
  sc_bv<64>*__xlx_bucket_0_output_buffer = new sc_bv<64>[__xlx_size_param_bucket_0];
  for (int i = 0; i < __xlx_size_param_bucket_0; ++i) {
    __xlx_bucket_0_output_buffer[i] = __xlx_bucket_0__input_buffer[i+__xlx_offset_param_bucket_0];
  }
  for (int i = 0; i < __xlx_size_param_bucket_0; ++i) {
    ((char*)__xlx_apatb_param_bucket_0)[i*8+0] = __xlx_bucket_0_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_bucket_0)[i*8+1] = __xlx_bucket_0_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_bucket_0)[i*8+2] = __xlx_bucket_0_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_bucket_0)[i*8+3] = __xlx_bucket_0_output_buffer[i].range(31, 24).to_uint();
    ((char*)__xlx_apatb_param_bucket_0)[i*8+4] = __xlx_bucket_0_output_buffer[i].range(39, 32).to_uint();
    ((char*)__xlx_apatb_param_bucket_0)[i*8+5] = __xlx_bucket_0_output_buffer[i].range(47, 40).to_uint();
    ((char*)__xlx_apatb_param_bucket_0)[i*8+6] = __xlx_bucket_0_output_buffer[i].range(55, 48).to_uint();
    ((char*)__xlx_apatb_param_bucket_0)[i*8+7] = __xlx_bucket_0_output_buffer[i].range(63, 56).to_uint();
  }
// print __xlx_apatb_param_bucket_1
  sc_bv<64>*__xlx_bucket_1_output_buffer = new sc_bv<64>[__xlx_size_param_bucket_1];
  for (int i = 0; i < __xlx_size_param_bucket_1; ++i) {
    __xlx_bucket_1_output_buffer[i] = __xlx_bucket_1__input_buffer[i+__xlx_offset_param_bucket_1];
  }
  for (int i = 0; i < __xlx_size_param_bucket_1; ++i) {
    ((char*)__xlx_apatb_param_bucket_1)[i*8+0] = __xlx_bucket_1_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_bucket_1)[i*8+1] = __xlx_bucket_1_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_bucket_1)[i*8+2] = __xlx_bucket_1_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_bucket_1)[i*8+3] = __xlx_bucket_1_output_buffer[i].range(31, 24).to_uint();
    ((char*)__xlx_apatb_param_bucket_1)[i*8+4] = __xlx_bucket_1_output_buffer[i].range(39, 32).to_uint();
    ((char*)__xlx_apatb_param_bucket_1)[i*8+5] = __xlx_bucket_1_output_buffer[i].range(47, 40).to_uint();
    ((char*)__xlx_apatb_param_bucket_1)[i*8+6] = __xlx_bucket_1_output_buffer[i].range(55, 48).to_uint();
    ((char*)__xlx_apatb_param_bucket_1)[i*8+7] = __xlx_bucket_1_output_buffer[i].range(63, 56).to_uint();
  }
// print __xlx_apatb_param_sum_0
  sc_bv<64>*__xlx_sum_0_output_buffer = new sc_bv<64>[__xlx_size_param_sum_0];
  for (int i = 0; i < __xlx_size_param_sum_0; ++i) {
    __xlx_sum_0_output_buffer[i] = __xlx_sum_0__input_buffer[i+__xlx_offset_param_sum_0];
  }
  for (int i = 0; i < __xlx_size_param_sum_0; ++i) {
    ((char*)__xlx_apatb_param_sum_0)[i*8+0] = __xlx_sum_0_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_sum_0)[i*8+1] = __xlx_sum_0_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_sum_0)[i*8+2] = __xlx_sum_0_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_sum_0)[i*8+3] = __xlx_sum_0_output_buffer[i].range(31, 24).to_uint();
    ((char*)__xlx_apatb_param_sum_0)[i*8+4] = __xlx_sum_0_output_buffer[i].range(39, 32).to_uint();
    ((char*)__xlx_apatb_param_sum_0)[i*8+5] = __xlx_sum_0_output_buffer[i].range(47, 40).to_uint();
    ((char*)__xlx_apatb_param_sum_0)[i*8+6] = __xlx_sum_0_output_buffer[i].range(55, 48).to_uint();
    ((char*)__xlx_apatb_param_sum_0)[i*8+7] = __xlx_sum_0_output_buffer[i].range(63, 56).to_uint();
  }
// print __xlx_apatb_param_sum_1
  sc_bv<64>*__xlx_sum_1_output_buffer = new sc_bv<64>[__xlx_size_param_sum_1];
  for (int i = 0; i < __xlx_size_param_sum_1; ++i) {
    __xlx_sum_1_output_buffer[i] = __xlx_sum_1__input_buffer[i+__xlx_offset_param_sum_1];
  }
  for (int i = 0; i < __xlx_size_param_sum_1; ++i) {
    ((char*)__xlx_apatb_param_sum_1)[i*8+0] = __xlx_sum_1_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_sum_1)[i*8+1] = __xlx_sum_1_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_sum_1)[i*8+2] = __xlx_sum_1_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_sum_1)[i*8+3] = __xlx_sum_1_output_buffer[i].range(31, 24).to_uint();
    ((char*)__xlx_apatb_param_sum_1)[i*8+4] = __xlx_sum_1_output_buffer[i].range(39, 32).to_uint();
    ((char*)__xlx_apatb_param_sum_1)[i*8+5] = __xlx_sum_1_output_buffer[i].range(47, 40).to_uint();
    ((char*)__xlx_apatb_param_sum_1)[i*8+6] = __xlx_sum_1_output_buffer[i].range(55, 48).to_uint();
    ((char*)__xlx_apatb_param_sum_1)[i*8+7] = __xlx_sum_1_output_buffer[i].range(63, 56).to_uint();
  }
}
