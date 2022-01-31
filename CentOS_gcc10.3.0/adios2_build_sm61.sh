cuda=/usr/local/cuda-10.2
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export installroot=$PWD
export srcroot=$installroot/../                                                                                              

# gcc
export gcc_install_root=$installroot/gcc/install
export LD_LIBRARY_PATH=$gcc_install_root/lib64:$LD_LIBRARY_PATH

# ADIOS2
export adios2_src_root=$srcroot/ADIOS2
export adios2_install_root=$installroot/adios2/install

cd $installroot
mkdir -p adios2/build
cd adios2/build

cmake $adios2_src_root -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_Fortran_COMPILER="gfortran" \
      -DCMAKE_CXX_COMPILER="g++" \
      -DCMAKE_C_COMPILER="gcc" \
      -DCMAKE_INSTALL_PREFIX=$adios2_install_root \
      -DADIOS2_BUILD_EXAMPLES=OFF \
      -DADIOS2_BUILD_TESTING=OFF

make -j4 install
