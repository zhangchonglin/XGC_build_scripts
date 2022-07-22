module load PrgEnv-gnu
module load systemlayer
module load cuda/11.4.2
module load cpe-cuda
module load cmake/3.22.0
module load valgrind4hpc/2.12.4
module load cray-fftw/3.3.8.12

export installroot=$PWD
export srcroot=$installroot/../XGC-Devel_fork/libs

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
