module load PrgEnv-gnu
module load systemlayer
module load cuda/11.4.2
module load cpe-cuda
module load cmake/3.22.0
module load valgrind4hpc/2.12.4
module load cray-fftw/3.3.8.12

export installroot=$PWD
export srcroot=$installroot/../                                                                                              

# kokkos
export kokkos_src_root=$srcroot/kokkos
export kokkos_install_root=$installroot/kokkos/install

cd $installroot
mkdir -p kokkos/build
cd kokkos/build

cmake $kokkos_src_root \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CXX_STANDARD=14 \
      -DCMAKE_CXX_COMPILER=CC \
      -DKokkos_ARCH_ZEN2=ON \
      -DKokkos_ARCH_AMPERE80=ON \
      -DKokkos_ENABLE_SERIAL=ON \
      -DKokkos_ENABLE_OPENMP=ON \
      -DKokkos_ENABLE_CUDA=ON \
      -DKokkos_ENABLE_CUDA_LAMBDA=ON \
      -DKokkos_ENABLE_DEBUG=OFF \
      -DBUILD_TESTING=OFF \
      -DKokkos_ENABLE_AGGRESSIVE_VECTORIZATION=ON \
      -DCMAKE_INSTALL_PREFIX=$kokkos_install_root

make -j4 install
