cuda=/usr/local/cuda-10.2
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export installroot=$PWD
export srcroot=$installroot/../                                                                                              

# kokkos
export kokkos_src_root=$srcroot/kokkos
export kokkos_install_root=$installroot/kokkos/install

# cabana
export cabana_src_root=$srcroot/cabana
export cabana_install_root=$installroot/cabana/install

export CMAKE_PREFIX_PATH=$kokkos_install_root:$CMAKE_PREFIX_PATH

cd $installroot
mkdir -p cabana/build
cd cabana/build

cmake $cabana_src_root \
      -DCMAKE_BUILD_TYPE=Release \
      -DKokkos_DIR=$kokkos_install_root/lib64/cmake/Kokkos \
      -DCMAKE_CXX_STANDARD=14 \
      -DCMAKE_CXX_COMPILER=$kokkos_src_root/bin/nvcc_wrapper \
      -DCabana_REQUIRE_CUDA=ON \
      -DCabana_ENABLE_CAJITA=OFF \
      -DCMAKE_INSTALL_PREFIX=$cabana_install_root

make -j4 install
