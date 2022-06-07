cuda=/usr/local/cuda-11.4
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export installroot=$PWD
export srcroot=$installroot/../                                                                                              
# gcc
export gcc_install_root=$installroot/gcc/install
source $gcc_install_root/activate

# ADIOS2
export adios2_install_root=$installroot/adios2/install
# kokkos
export kokkos_install_root=$installroot/kokkos/install
# cabana
export cabana_install_root=$installroot/cabana/install
# camtimers
export camtimers_src_root=$srcroot/XGC-Devel/libs/camtimers
export camtimers_install_root=$camtimers_src_root
# pspline
export pspline_install_root=$installroot/pspline/install
# FFTW3
export fftw3_install_root=$installroot/fftw3/install
# LAPACK
export lapack_install_root=$installroot/lapack/install

# xgc
export xgc_src_root=$srcroot/XGC-Devel
export xgc_install_root=$installroot/xgc/install

export CMAKE_PREFIX_PATH=$lapack_install_root:$fftw3_install_root:$adios2_install_root:$kokkos_install_root:$cabana_install_root:$CMAKE_PREFIX_PATH

cd $installroot
mkdir -p xgc/build
cd xgc/build

export XGC_PLATFORM=centos10
cmake $xgc_src_root \
      -DCMAKE_BUILD_TYPE=Debug -DDELTAF_CONV=ON \
      -DCMAKE_Fortran_COMPILER="gfortran" \
      -DCMAKE_CXX_COMPILER="g++" \
      -DCMAKE_C_COMPILER="gcc" \
      -DCMAKE_C_FLAGS="-fopenmp" \
      -DCMAKE_CXX_FLAGS="-fopenmp" \
      -DCMAKE_Fortran_FLAGS="-fopenmp"

make -j4 xgc-es-cpp xgc-es-cpp-gpu
