module load PrgEnv-gnu
module load systemlayer
module load cuda/11.3.1
module load cpe-cuda
module load cmake/3.22.0
module load valgrind4hpc/2.12.4
module load cray-fftw/3.3.8.12

export installroot=$PWD
export srcroot=$installroot/../                                                                                              

# ADIOS2
export adios2_install_root=$installroot/ADIOS2/install
# kokkos
export kokkos_install_root=$installroot/kokkos/install
# cabana
export cabana_src_root=$srcroot/cabana
export cabana_install_root=$installroot/cabana/install

# camtimers
export camtimers_src_root=$srcroot/XGC-Devel/libs/camtimers
export camtimers_install_root=$camtimers_src_root
# pspline
export pspline_install_root=$installroot/pspline/install

# xgc
export xgc_src_root=$srcroot/XGC-Devel
export xgc_install_root=$installroot/xgc/install

export CMAKE_PREFIX_PATH=$adios2_install_root:$kokkos_install_root:$cabana_install_root:$CMAKE_PREFIX_PATH
export CRAYPE_LINK_TYPE=dynamic
export PETSC_DIR=$srcroot/petsc
export PETSC_ARCH=arch-perlmutter
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PETSC_DIR/$PETSC_ARCH/lib/pkgconfig

cd $installroot
mkdir -p xgc/build
cd xgc/build

cmake $xgc_src_root \
      -DCMAKE_BUILD_TYPE=Debug -DXGC1=ON \
      -DNEW_FLX_AIF=ON -DDELTAF_CONV=ON -DRHO_PARA_DERIVS=ON \
      -DRHO_PARA_DERIVS_CPU=ON \
      -DUSE_SYSTEM_PSPLINE=ON -DUSE_SYSTEM_CAMTIMERS=ON \
      -DPSPLINE_INCLUDE_DIRS=$pspline_install_root/include \
      -DPSPLINE_LIBRARIES=$pspline_install_root/lib/libpspline.a \
      -DCAMTIMERS_INCLUDE_DIRS=$camtimers_install_root \
      -DCAMTIMERS_LIBRARIES=$camtimers_install_root/libtimers.a

make VERBOSE=1 xgc-es-cpp
