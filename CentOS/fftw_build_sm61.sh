export installroot=$PWD
export srcroot=$installroot/../                                                                                              

# FFTW3
export fftw3_src_root=$srcroot/fftw-3.3.10
export fftw3_install_root=$installroot/fftw3/install

cd $installroot
mkdir -p fftw3/build
cd fftw3/build

cmake $fftw3_src_root -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$fftw3_install_root

make -j4 install
