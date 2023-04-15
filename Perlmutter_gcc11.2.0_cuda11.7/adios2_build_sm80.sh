module load PrgEnv-gnu
module load cudatoolkit/11.7
module load cmake/3.22.0
module unload darshan
module list

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
