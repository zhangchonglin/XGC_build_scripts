set(USER_LIB_DIR "/hdds1/RPI/XGC/XGC/install")

set(USE_SYSTEM_CAMTIMERS OFF CACHE BOOL "Use system camtimers")
set(USE_SYSTEM_PSPLINE OFF CACHE BOOL "Use system pspline")
#set(GTEST_ROOT "${USER_LIB_DIR}/gtest/install")

set(GPU_Fortran_FLAGS )
set(LINK_FLAGS )
set(GPU_LINK_FLAGS )
set(UNIT_TEST_LINK_FLAGS )

# find dependent packages; in reality, this should be put in CMakeLists.txt;
# close to find_package(ADIOS2, KOKKOS CABANA) etc.
find_package(FFTW3 REQUIRED)
find_package(LAPACK REQUIRED)

# no CUDA-aware MPI
set(PETSC_ROOT "${USER_LIB_DIR}/../petsc/arch-centos7")
set(PETSC_INC "${PETSC_ROOT}/../include")

find_library(petsc petsc ${PETSC_ROOT}/lib)
find_library(parmetis parmetis ${PETSC_ROOT}/lib)
find_library(metis metis ${PETSC_ROOT}/lib)
set(PETSC_LINK_LIBRARIES ${petsc} ${parmetis} ${metis})
find_path(PETSC_INCLUDE_DIRS NAMES petscconf.h PATHS "${PETSC_ROOT}/include")
find_path(PETSC_INCLUDE_DIRS NAMES petscversion.h PATHS "${PETSC_INC}")
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(PETSC
  REQUIRED_VARS PETSC_LINK_LIBRARIES PETSC_INCLUDE_DIRS)
if(PETSC_FOUND)
  if(NOT TARGET PETSC::PETSC)
    add_library(PETSC::PETSC INTERFACE IMPORTED)
    set_property(TARGET PETSC::PETSC PROPERTY
      INTERFACE_INCLUDE_DIRECTORIES "${PETSC_INCLUDE_DIRS}" "${PETSC_INC}")
    set_property(TARGET PETSC::PETSC PROPERTY
      INTERFACE_LINK_LIBRARIES "${PETSC_LINK_LIBRARIES}")
  endif()
endif()

