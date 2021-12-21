module load PrgEnv-gnu
module load systemlayer
module load cuda/11.3.1
module load cpe-cuda
module load cmake/3.22.0
module load valgrind4hpc/2.12.4

export installroot=$PWD
export srcroot=$installroot/../                                                                                              

# ADIOS2
export adios2_src_root=$srcroot/ADIOS2
export adios2_install_root=$installroot/ADIOS2/install

cd $installroot
mkdir -p ADIOS2/build
cd ADIOS2/build

cmake $adios2_src_root -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$adios2_install_root \
      -DADIOS2_BUILD_EXAMPLES=OFF \
      -DADIOS2_BUILD_TESTING=OFF

make -j4 install
