#!/usr/bin/python
if __name__ == '__main__':
  import sys
  import os
  sys.path.insert(0, os.path.abspath('config'))
  import configure
  configure_options = [
    '--with-cc=cc',
    '--with-cxx=CC',
    '--with-fc=ftn',
    '--with-debugging=no',
    '--with-shared-libraries=1',
    '--with-ssl=0',
    '--COPTFLAGS=-g -fast -fPIC',
    '--CXXOPTFLAGS=-g -fast -fPIC',
    '--FOPTFLAGS=-g -fast -fPIC',
    '--with-mpiexec=srun',
    '--with-64-bit-indices',
    '--with-batch=1',
    '--with-cuda',
    '--with-cuda-gencodearch=80',
    '--with-cudac=nvcc',
    '-download-sowing-cc=nvc',
#    '--with-fortran-bindings=0',
    '--download-metis',
    '--download-parmetis',
    '--with-make-np=8',
  ]
  configure.petsc_configure(configure_options)
