export installroot=$PWD
export srcroot=$installroot/../                                                                                              

# LAPACK
export lapack_src_root=$srcroot/lapack-3.10.0
export lapack_install_root=$installroot/lapack/install

cd $installroot
mkdir -p lapack/build
cd lapack/build

cmake $lapack_src_root -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$lapack_install_root

make -j4 install
