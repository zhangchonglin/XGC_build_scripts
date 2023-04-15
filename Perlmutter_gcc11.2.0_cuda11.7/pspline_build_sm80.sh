module load PrgEnv-gnu
module load cudatoolkit/11.7
module load cmake/3.22.0
module load valgrind4hpc/2.12.11
module load cray-fftw/3.3.10.3
module unload darshan
module list

export installroot=$PWD
export srcroot=$installroot/../XGC-Devel/libs

# pspline
export pspline_src=$srcroot/pspline
export pspline_install_root=$installroot/pspline/install

cd $installroot
mkdir -p pspline/build
cd pspline/build

cmake $pspline_src \
      -DCMAKE_C_COMPILER="cc" \
      -DCMAKE_CXX_COMPILER="CC" \
      -DCMAKE_Fortran_COMPILER="ftn" \
      -DCMAKE_C_FLAGS="-g -O3" \
      -DCMAKE_CXX_FLAGS="-g -O3" \
      -DCMAKE_Fortran_FLAGS="-g -O3 -fpic -ffree-line-length-0 -fallow-argument-mismatch"\
      -DCMAKE_INSTALL_PREFIX=$pspline_install_root
      -DCMAKE_BUILD_TYPE=Release

make -j4 install
