module load PrgEnv-nvidia/8.3.3
module load cudatoolkit/11.5
module load cmake/3.22.0
module load valgrind4hpc/2.12.8
module unload darshan

export installroot=$PWD
export srcroot=$installroot/../                                                                                              

# kokkos
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
      -DKokkos_DIR=$KOKKOS_INSTALL_DIR/lib64/cmake/Kokkos \
      -DCMAKE_CXX_STANDARD=14 \
      -DCMAKE_CXX_COMPILER=CC \
      -DCabana_REQUIRE_CUDA=ON \
      -DCabana_ENABLE_CAJITA=OFF \
      -DCMAKE_INSTALL_PREFIX=$cabana_install_root

make -j4 install
