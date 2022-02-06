module load PrgEnv-gnu
module load systemlayer
module load cuda/11.4.2
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
export xgc_src_root=$srcroot/XGC-Devel_fork
export xgc_install_root=$installroot/xgc/install

export CMAKE_PREFIX_PATH=$adios2_install_root:$kokkos_install_root:$cabana_install_root:$CMAKE_PREFIX_PATH
export CRAYPE_LINK_TYPE=dynamic

cd $installroot
mkdir -p xgc/build
cd xgc/build

export XGC_PLATFORM=perlmutter_gcc10
cmake $xgc_src_root \
      -DCMAKE_BUILD_TYPE=RelWithDebInfo \
      -DDELTAF_CONV=ON \

make xgc-es-cpp-gpu
