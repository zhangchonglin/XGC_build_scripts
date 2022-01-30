cuda=/usr/local/cuda-10.2
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export installroot=$PWD
export srcroot=$installroot/../XGC-Devel/libs

# pspline
export pspline_src=$srcroot/pspline
export pspline_install_root=$installroot/pspline/install

cd $installroot
mkdir -p pspline/build
cd pspline/build

cmake $pspline_src \
      -DCMAKE_Fortran_COMPILER="gfortran" \
      -DCMAKE_Fortran_FLAGS="-fpic -ffree-line-length-0"\
      -DCMAKE_INSTALL_PREFIX=$pspline_install_root
      -DCMAKE_BUILD_TYPE=Release

make -j4 install
