# xgc build scripts

These include build scripts for:
- Perlmutter using `nvhpc`;
- CentOS 7 using `gcc 7.3.0`, and CentOS 8 stream using `gcc 10.3.0`.

Note:
- the buiilding process was successful with `gcc 7.3.0`, however the simulation crashed at a c++ to fortran call, likely due to the fortran iso-c binding issue;
- the building process was successful with `gcc 10.3.0` and the run was successful.

Scripts build the following `XGC` dependent libraries manually:
- ADIOS2
- kokkos
- cabana
- FFTW3
- LAPACK
- PETSc
- Camtimer
- pspline
