/*
Implementations based on:
Harish and Narayanan. "Accelerating large graph algorithms on the GPU using CUDA." HiPC, 2007.
Hong, Oguntebi, Olukotun. "Efficient Parallel Graph Exploration on Multi-Core CPU and GPU." PACT, 2011.
*/

#include "bfs.h"

void bfs(node_t nodes[N_NODES], edge_t edges[N_EDGES],
            node_index_t starting_node, level_t level[N_NODES],
            edge_index_t level_counts[N_LEVELS])
{
#pragma HLS array_partition variable=level type=cyclic factor=2 dim=1 // set_directive_array_partition -factor 2 -type cyclic bfs level
#pragma HLS array_reshape variable=edges type=cyclic factor=2 dim=1  // set_directive_array_reshape -factor 2 -type cyclic bfs edges
#pragma HLS array_partition variable=nodes type=block factor=2 dim=1 // set_directive_array_partition -factor 2 -type block bfs nodes
  node_index_t n;
  edge_index_t e;
  level_t horizon;
  edge_index_t cnt;
#pragma HLS bind_op variable=cnt op=add impl=fabric latency=True  // set_directive_bind_op -op add -impl fabric -latency -1 bfs/loop_neighbors cnt
// set_directive_bind_op -op add -impl fabric -latency -1 bfs/loop_neighbors cnt  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)

  level[starting_node] = 0;
  level_counts[0] = 1;

  loop_horizons: for( horizon=0; horizon<N_LEVELS; horizon++ ) {
#pragma HLS bind_op variable=horizon op=add impl=fabric latency=True  // set_directive_bind_op -op add -impl fabric -latency -1 bfs/loop_horizons horizon
// set_directive_bind_op -op add -impl fabric -latency -1 bfs/loop_horizons horizon  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS unroll factor=2  // set_directive_unroll -factor 2 bfs/loop_horizons
    cnt = 0;
    // Add unmarked neighbors of the current horizon to the next horizon
    loop_nodes: for( n=0; n<N_NODES; n++ ) {
#pragma HLS bind_op variable=n op=add impl=fabric latency=True  // set_directive_bind_op -op add -impl fabric -latency -1 bfs/loop_nodes n
// set_directive_bind_op -op add -impl fabric -latency -1 bfs/loop_nodes n  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
      if( level[n]==horizon ) {
        edge_index_t tmp_begin = nodes[n].edge_begin;
        edge_index_t tmp_end = nodes[n].edge_end;
        loop_neighbors: for( e=tmp_begin; e<tmp_end; e++ ) {
#pragma HLS bind_op variable=e op=add impl=dsp latency=True  // set_directive_bind_op -op add -impl dsp -latency -1 bfs/loop_neighbors e
// set_directive_bind_op -op add -impl dsp -latency -1 bfs/loop_neighbors e  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS pipeline style=stp  // set_directive_pipeline -style stp bfs/loop_neighbors
#pragma HLS unroll factor=2  // set_directive_unroll -factor 2 bfs/loop_neighbors
          node_index_t tmp_dst = edges[e].dst;
          level_t tmp_level = level[tmp_dst];

          if( tmp_level ==MAX_LEVEL ) { // Unmarked
            level[tmp_dst] = horizon+1;
            ++cnt;
          }
        }
      }
    }
    if( (level_counts[horizon+1]=cnt)==0 )
      break;
  }
}
