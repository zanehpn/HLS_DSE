#include "viterbi.h"

int viterbi( tok_t obs[N_OBS], prob_t init[N_STATES], prob_t transition[N_STATES*N_STATES], prob_t emission[N_STATES*N_TOKENS], state_t path[N_OBS] )
{
#pragma HLS array_partition variable=path type=block factor=2 dim=1 // set_directive_array_partition -factor 2 -type block viterbi path
#pragma HLS array_reshape variable=emission type=block factor=2 dim=1  // set_directive_array_reshape -factor 2 -type block viterbi emission
#pragma HLS array_partition variable=emission type=block factor=2 dim=1 // set_directive_array_partition -factor 2 -type block viterbi emission
#pragma HLS array_reshape variable=transition type=block factor=2 dim=1  // set_directive_array_reshape -factor 2 -type block viterbi transition
#pragma HLS array_partition variable=transition type=block factor=2 dim=1 // set_directive_array_partition -factor 2 -type block viterbi transition
#pragma HLS array_reshape variable=init type=block factor=2 dim=1  // set_directive_array_reshape -factor 2 -type block viterbi init
// set_directive_bind_storage -type ram_1wnr -impl bram -latency -1 viterbi llike  // (no mapping available)
#pragma HLS array_reshape variable=llike type=cyclic factor=2 dim=1  // set_directive_array_reshape -factor 2 -type cyclic viterbi llike
#pragma HLS array_partition variable=llike type=cyclic factor=2 dim=1 // set_directive_array_partition -factor 2 -type cyclic viterbi llike
  prob_t llike[N_OBS][N_STATES];
  step_t t;
  state_t prev, curr;
  prob_t min_p, p;
// set_directive_bind_op -op dadd -impl fabric -latency -1 viterbi/L_backtrack min_p  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
  state_t min_s, s;
  // All probabilities are in -log space. (i.e.: P(x) => -log(P(x)) )
 
  // Initialize with first observation and initial probabilities
  for( s=0; s<N_STATES; s++ ) {
// set_directive_bind_op -op add -impl dsp -latency -1 viterbi/L_init s  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline style=stp  // set_directive_pipeline -style stp viterbi/L_init
#pragma HLS unroll factor=2  // set_directive_unroll -factor 2 viterbi/L_init
    llike[0][s] = init[s] + emission[s*N_TOKENS+obs[0]];
  }

  // Iteratively compute the probabilities over time
  for( t=1; t<N_OBS; t++ ) {
#pragma HLS bind_op variable=t op=add impl=fabric latency=True  // set_directive_bind_op -op add -impl fabric -latency -1 viterbi/L_timestep t
// set_directive_bind_op -op add -impl fabric -latency -1 viterbi/L_timestep t  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS unroll factor=2  // set_directive_unroll -factor 2 viterbi/L_timestep
// set_directive_loop_flatten -off viterbi/L_timestep  // (no mapping available)
    for( curr=0; curr<N_STATES; curr++ ) {
#pragma HLS bind_op variable=curr op=add impl=dsp latency=True  // set_directive_bind_op -op add -impl dsp -latency -1 viterbi/L_curr_state curr
// set_directive_bind_op -op add -impl dsp -latency -1 viterbi/L_curr_state curr  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline off  // set_directive_pipeline -off viterbi/L_curr_state
      // Compute likelihood HMM is in current state and where it came from.
      prev = 0;
      min_p = llike[t-1][prev] +
              transition[prev*N_STATES+curr] +
              emission[curr*N_TOKENS+obs[t]];
      for( prev=1; prev<N_STATES; prev++ ) {
#pragma HLS bind_op variable=prev op=add impl=fabric latency=True  // set_directive_bind_op -op add -impl fabric -latency -1 viterbi/L_prev_state prev
// set_directive_bind_op -op add -impl fabric -latency -1 viterbi/L_prev_state prev  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline style=stp  // set_directive_pipeline -style stp viterbi/L_prev_state
#pragma HLS unroll factor=2  // set_directive_unroll -factor 2 viterbi/L_prev_state
        p = llike[t-1][prev] +
            transition[prev*N_STATES+curr] +
            emission[curr*N_TOKENS+obs[t]];
        if( p<min_p ) {
          min_p = p;
// set_directive_bind_op -op dadd -impl fulldsp -latency -1 viterbi/L_prev_state p  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
        }
      }
      llike[t][curr] = min_p;
#pragma HLS bind_op variable=min_p op=dadd impl=fabric latency=True  // set_directive_bind_op -op dadd -impl fabric -latency -1 viterbi/L_curr_state min_p
// set_directive_bind_op -op dadd -impl fabric -latency -1 viterbi/L_curr_state min_p  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
    }
  }

  // Identify end state
  min_s = 0;
  min_p = llike[N_OBS-1][min_s];
  for( s=1; s<N_STATES; s++ ) {
// set_directive_bind_op -op add -impl fabric -latency -1 viterbi/L_end s  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline off  // set_directive_pipeline -off viterbi/L_end
#pragma HLS unroll factor=2  // set_directive_unroll -factor 2 viterbi/L_end
    p = llike[N_OBS-1][s];
    if( p<min_p ) {
      min_p = p;
      min_s = s;
    }
  }
  path[N_OBS-1] = min_s;

  // Backtrack to recover full path
  for( t=N_OBS-2; t>=0; t-- ) {
#pragma HLS bind_op variable=t op=sub impl=fabric latency=True  // set_directive_bind_op -op sub -impl fabric -latency -1 viterbi/L_backtrack t
// set_directive_bind_op -op sub -impl fabric -latency -1 viterbi/L_backtrack t  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline style=stp  // set_directive_pipeline -style stp viterbi/L_backtrack
#pragma HLS unroll factor=2  // set_directive_unroll -factor 2 viterbi/L_backtrack
    min_s = 0;
    min_p = llike[t][min_s] + transition[min_s*N_STATES+path[t+1]];
    for( s=1; s<N_STATES; s++ ) {
#pragma HLS bind_op variable=s op=add impl=dsp latency=True  // set_directive_bind_op -op add -impl dsp -latency -1 viterbi/L_state s
// set_directive_bind_op -op add -impl dsp -latency -1 viterbi/L_state s  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
      p = llike[t][s] + transition[s*N_STATES+path[t+1]];
      if( p<min_p ) {
        min_p = p;
#pragma HLS bind_op variable=p op=dadd impl=fulldsp latency=True  // set_directive_bind_op -op dadd -impl fulldsp -latency -1 viterbi/L_state p
// set_directive_bind_op -op dadd -impl fulldsp -latency -1 viterbi/L_state p  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
        min_s = s;
      }
    }
    path[t] = min_s;
  }

  return 0;
}

