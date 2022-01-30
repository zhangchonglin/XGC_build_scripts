cuda=/usr/local/cuda-10.2
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export installroot=$PWD
export srcroot=$installroot/../                                                                                              

# ADIOS2
export adios2_src_root=$srcroot/ADIOS2
export adios2_install_root=$installroot/adios2/install

cd $installroot
mkdir -p adios2/build
cd adios2/build

cmake $adios2_src_root -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_Fortran_COMPILER="gfortran" \
      -DCMAKE_INSTALL_PREFIX=$adios2_install_root \
      -DADIOS2_BUILD_EXAMPLES=OFF \
      -DADIOS2_BUILD_TESTING=OFF

make VERBOSE=1 -j4 install
