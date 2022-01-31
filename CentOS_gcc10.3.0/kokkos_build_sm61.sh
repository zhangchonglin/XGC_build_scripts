cuda=/usr/local/cuda-10.2
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export installroot=$PWD
export srcroot=$installroot/../                                                                                              

# gcc
export gcc_install_root=$installroot/gcc/install
export LD_LIBRARY_PATH=$gcc_install_root/lib64:$LD_LIBRARY_PATH

# kokkos
export kokkos_src_root=$srcroot/kokkos
export kokkos_install_root=$installroot/kokkos/install

cd $installroot
mkdir -p kokkos/build
cd kokkos/build

cmake $kokkos_src_root \
      -DCMAKE_BUILD_TYPE=Debug \
      -DCMAKE_CXX_STANDARD=14 \
      -DCMAKE_CXX_COMPILER=$kokkos_src_root/bin/nvcc_wrapper \
      -DKokkos_ARCH_PASCAL61=ON \
      -DKokkos_ENABLE_SERIAL=ON \
      -DKokkos_ENABLE_OPENMP=OFF \
      -DKokkos_ENABLE_CUDA=ON \
      -DKokkos_ENABLE_CUDA_LAMBDA=ON \
      -DKokkos_ENABLE_DEBUG=ON \
      -DBUILD_TESTING=OFF \
      -DKokkos_ENABLE_AGGRESSIVE_VECTORIZATION=ON \
      -DCMAKE_INSTALL_PREFIX=$kokkos_install_root

make -j4 install
