export installroot=$PWD
export srcroot=$installroot/../XGC-Devel/libs

# gcc
export gcc_install_root=$installroot/gcc/install
#source $gcc_install_root/activate

# pspline
export pspline_src=$srcroot/pspline
export pspline_install_root=$installroot/pspline/install

cd $installroot
mkdir -p pspline/build
cd pspline/build

cmake $pspline_src \
      -DCMAKE_Fortran_COMPILER="gfortran" \
      -DCMAKE_Fortran_FLAGS="-fpic -ffree-line-length-0 -fallow-argument-mismatch" \
      -DCMAKE_INSTALL_PREFIX=$pspline_install_root
      -DCMAKE_BUILD_TYPE=Release

make -j4 install
