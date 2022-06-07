cuda=/usr/local/cuda-11.4
# gcc
export petsc_root=$PWD
export gcc_install_root=$petsc_root/../install/gcc/install
source $gcc_install_root/activate
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export petsc_installroot=$PWD
export PETSC_DIR=$petsc_installroot
export PETSC_ARCH=arch-centos8
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PETSC_DIR/$PETSC_ARCH/lib/pkgconfig
