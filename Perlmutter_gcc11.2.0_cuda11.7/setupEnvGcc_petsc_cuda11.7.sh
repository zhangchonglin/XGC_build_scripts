module load PrgEnv-gnu
module load cudatoolkit/11.7
module load cmake/3.22.0
module load valgrind4hpc/2.12.11

export cuda=$CRAY_HOME
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export installroot=$PWD
export PETSC_DIR=$installroot
export PETSC_ARCH=arch-perlmutter
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PETSC_DIR/$PETSC_ARCH/lib/pkgconfig

export OMPI_CXX=CC
export OMPI_CC=cc
export OMPI_FC=ftn
