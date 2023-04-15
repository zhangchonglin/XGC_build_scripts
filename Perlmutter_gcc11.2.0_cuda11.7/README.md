## XGC build scripts for NERSC Perlmutter

### Configure and building scripts includes:
```
- PETSc 3.17.5: https://gitlab.com/petsc/petsc.git;
- ADIOS2 2.8.3: https://github.com/ornladios/ADIOS2.git;
- kokkos `3.7.01` branch: https://github.com/kokkos/kokkos.git;
- cabana master branch: https://github.com/ECP-copa/Cabana.git, at commit: `32facc1`;
- camtimer from XGC source code;
- pspline from XGC source code;
- XGC master branch: https://github.com/PrincetonUniversity/XGC-Devel.git, at commit: `ae4e8fa`.
```
using `cuda/11.7`, `gcc 11.2.0`, `cray-mpich 8.1.25`.

### Build the libraries in order:
```
 - PETSc
 - ADIOS2
 - kokkos
 - cabana
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
   XGC-Devel_fork
```

(1) To build `PETSc`, do the following in the `PETSc` source directory:
- `source setupEnvGcc_petsc_cuda11.7.sh`;
- run `./arch_perlmutter.py` to configure;
- make/build following the output from `PETSc` configuration, something like this:
  ```
   make PETSC_DIR=... PETSC_ARCH=arch_perlmutter all
  ```

(2) create a new folder called `install` within the `xgc_install` directory: `xgc_install/install`.

(3) copy the build script to the `install` folder and use the build script to build each library, for example:
```
.adios2_build_sm80.sh
./kokkos_build_sm80.sh
```
Note:
- the current build script works for Nvidia Ampere architecture;
- for a different GPU, the architecture name and `sm number` need to be modified accordingly;
- build `camtimer` in the source directory using `make -f MAKEFILE/Makefile.Perlmutter`.

(4) the final `XGC` binary/binaries will be in the following location: `xgc_install/install/xgc/build/bin/`.

This can be then copied to the test case directory (or linked in the run script) to run.

