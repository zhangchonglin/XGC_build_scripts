#!/usr/bin/python3
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
    '--with-shared-libraries=0',
    '--with-static-libraries=1',
    '--with-ssl=0',
    '--COPTFLAGS=-g -Ofast -fPIC',
    '--CXXOPTFLAGS=-g -Ofast -fPIC',
    '--FOPTFLAGS=-g -Ofast -fPIC',
    '--with-mpiexec=srun',
    '--with-64-bit-indices',
    '--with-batch=1',
    '--with-cuda',
    '--with-cuda-gencodearch=80',
    '--with-cudac=nvcc',
    '--download-metis',
    '--download-parmetis',
    '--with-make-np=8',
  ]
  configure.petsc_configure(configure_options)
