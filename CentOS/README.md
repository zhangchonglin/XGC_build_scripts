# XGC build scripts for CentOS 7

Configure and building scripts includes:
```
- PETSc 3.16.2: https://gitlab.com/petsc/petsc
- ADIOS2 v2.7.1.436: https://github.com/ornladios/ADIOS2.git
- kokkos master branch: https://github.com/kokkos/kokkos, at commit: 2834f94
- cabana master branch: https://github.com/ECP-copa/Cabana.git, at commit: 191b358
- FFTW 3.3.10
- LAPACK 3.10.0
- camtimer from XGC source code
- pspline from XGC source code
- XGC master branch: https://github.com/PrincetonUniversity/XGC-Devel.git, at commit: 6b8bb72
```
using `cuda/10.2.89`, `gcc 7.3.1`, `mpich 3.3.2` by loading:

Build the libraries in order:
```
 - PETSc
 - ADIOS2
 - kokkos
 - cabana
 - FFTW 3.3.10
 - LAPACK 3.10.0
 - camtimer
 - pspline
 - XGC
```

(0) create a folder, for example `xgc_install`, and clone all the repository in the folder, all repository in separate folder with the following names:
```
   kokkos
   ADIOS2
   cabana
   petsc
   fftw-3.3.10
   lapack-3.10.0
   XGC-Devel
```

(1) To build `PETSc`, do the following in the `PETSc` source directory:
- `source setupEnvGcc_petsc_centos7.sh`;
- run `./arch-centos7.py` to configure;
- make/build following the output from `PETSc` configuration, something like this:
  ```
   make PETSC_DIR=... PETSC_ARCH=arch-centos7 all
  ```

(2) create a new folder called `install` within the `xgc_install` directory: `xgc_install/install`.

(3) copy the build script to the `install` folder and use the build script to build each library, for example:
```
./adios2_build_sm61.sh
./kokkos_build_sm61.sh
```
Note:
- the current build script works for Nvidia Pascal architecture;
- for a different GPU, the architecture name and `sm number` need to be modified accordingly.

(4) the final `XGC` binary/binaries will be in the following location: `xgc_install/install/xgc/build/bin/`.

This can be then copied to the test case directory (or linked in the run script) to run.
