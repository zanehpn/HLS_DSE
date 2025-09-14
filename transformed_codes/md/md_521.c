/*
Implemenataion based on:
A. Danalis, G. Marin, C. McCurdy, J. S. Meredith, P. C. Roth, K. Spafford, V. Tipparaju, and J. S. Vetter.
The scalable heterogeneous computing (shoc) benchmark suite.
In Proceedings of the 3rd Workshop on General-Purpose Computation on Graphics Processing Units, 2010.
*/

#include "md.h"

void md_kernel(TYPE force_x[nAtoms],
               TYPE force_y[nAtoms],
               TYPE force_z[nAtoms],
               TYPE position_x[nAtoms],
               TYPE position_y[nAtoms],
               TYPE position_z[nAtoms],
               int32_t NL[nAtoms*maxNeighbors])
{
#pragma HLS array_partition variable=NL type=cyclic factor=2 dim=1 // set_directive_array_partition -factor 2 -type cyclic md_kernel NL
#pragma HLS array_reshape variable=position_z type=cyclic factor=2 dim=1  // set_directive_array_reshape -factor 2 -type cyclic md_kernel position_z
#pragma HLS array_partition variable=position_z type=cyclic factor=2 dim=1 // set_directive_array_partition -factor 2 -type cyclic md_kernel position_z
#pragma HLS array_partition variable=position_y type=cyclic factor=2 dim=1 // set_directive_array_partition -factor 2 -type cyclic md_kernel position_y
#pragma HLS array_partition variable=position_x type=cyclic factor=2 dim=1 // set_directive_array_partition -factor 2 -type cyclic md_kernel position_x
    TYPE delx, dely, delz, r2inv;
#pragma HLS bind_op variable=delx op=dsub impl=fabric latency=True  // set_directive_bind_op -op dsub -impl fabric -latency -1 md_kernel/loop_j delx
// set_directive_bind_op -op dsub -impl fabric -latency -1 md_kernel/loop_j delx  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
    TYPE r6inv, potential, force, j_x, j_y, j_z;
#pragma HLS bind_op variable=r6inv op=dmul impl=fabric latency=True  // set_directive_bind_op -op dmul -impl fabric -latency -1 md_kernel/loop_j r6inv
// set_directive_bind_op -op dmul -impl fabric -latency -1 md_kernel/loop_j r6inv  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
    TYPE i_x, i_y, i_z, fx, fy, fz;
#pragma HLS bind_op variable=fz op=dmul impl=fabric latency=True  // set_directive_bind_op -op dmul -impl fabric -latency -1 md_kernel/loop_j fz
// set_directive_bind_op -op dmul -impl fabric -latency -1 md_kernel/loop_j fz  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS bind_op variable=fy op=dmul impl=fulldsp latency=True  // set_directive_bind_op -op dmul -impl fulldsp -latency -1 md_kernel/loop_j fy
// set_directive_bind_op -op dmul -impl fulldsp -latency -1 md_kernel/loop_j fy  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS bind_op variable=fx op=dmul impl=fulldsp latency=True  // set_directive_bind_op -op dmul -impl fulldsp -latency -1 md_kernel/loop_j fx
// set_directive_bind_op -op dmul -impl fulldsp -latency -1 md_kernel/loop_j fx  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)

    int32_t i, j, jidx;

for (i = 0; i < nAtoms; i++){
#pragma HLS pipeline off  // set_directive_pipeline -off md_kernel/loop_i
             i_x = position_x[i];
             i_y = position_y[i];
             i_z = position_z[i];
             fx = 0;
             fy = 0;
             fz = 0;
for( j = 0; j < maxNeighbors; j++){
#pragma HLS pipeline style=stp  // set_directive_pipeline -style stp md_kernel/loop_j
             // Get neighbor
             jidx = NL[i*maxNeighbors + j];
             // Look up x,y,z positions
             j_x = position_x[jidx];
             j_y = position_y[jidx];
             j_z = position_z[jidx];
             // Calc distance
             delx = i_x - j_x;
             dely = i_y - j_y;
             delz = i_z - j_z;
             r2inv = 1.0/( delx*delx + dely*dely + delz*delz );
#pragma HLS bind_op variable=delz op=dsub impl=fabric latency=True  // set_directive_bind_op -op dsub -impl fabric -latency -1 md_kernel/loop_j delz
// set_directive_bind_op -op dsub -impl fabric -latency -1 md_kernel/loop_j delz  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
#pragma HLS bind_op variable=dely op=dsub impl=fulldsp latency=True  // set_directive_bind_op -op dsub -impl fulldsp -latency -1 md_kernel/loop_j dely
// set_directive_bind_op -op dsub -impl fulldsp -latency -1 md_kernel/loop_j dely  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
             // Assume no cutoff and aways account for all nodes in area
             r6inv = r2inv * r2inv * r2inv;
#pragma HLS bind_op variable=r2inv op=dmul impl=fabric latency=True  // set_directive_bind_op -op dmul -impl fabric -latency -1 md_kernel/loop_j r2inv
// set_directive_bind_op -op dmul -impl fabric -latency -1 md_kernel/loop_j r2inv  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
             potential = r6inv*(lj1*r6inv - lj2);
             // Sum changes in force
             force = r2inv*potential;
#pragma HLS bind_op variable=potential op=dmul impl=fabric latency=True  // set_directive_bind_op -op dmul -impl fabric -latency -1 md_kernel/loop_j potential
// set_directive_bind_op -op dmul -impl fabric -latency -1 md_kernel/loop_j potential  // (verify mapping - tool-specific; you may need to replace with RESOURCE/ALLOCATION pragma)
             fx += delx * force;
             fy += dely * force;
             fz += delz * force;
         }
         //Update forces after all neighbors accounted for.
         force_x[i] = fx;
         force_y[i] = fy;
         force_z[i] = fz;
         //printf("dF=%lf,%lf,%lf\n", fx, fy, fz);
         }
}
