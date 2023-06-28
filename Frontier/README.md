## XGC build scripts for OLCF Frontier

- Build XGC on Frontier based on XGC provided dependencies, instead of building own dependencies;
- The provided script builds `xgc-es-cpp-gpu` for delta-f electrostatic simulation;
- `PrgEnv-amd` is used with the following libraries:
```
 amd/5.2.0
 cray-mpich/8.1.25
 craype-accel-amd-gfx90a
```
With `craype-accel-amd-gfx90a`, GPU-aware MPI is being enabled. 
