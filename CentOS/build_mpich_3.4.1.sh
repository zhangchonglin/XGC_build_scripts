./configure --prefix=/hdds1/mpich/mpich-3.4.1-install FFLAGS=-fallow-argument-mismatch |& tee c.txt
make -j4 |& tee m.txt
make install |& tee mi.txt

# add missing link to library
#ld -lpsm2 --verbose
#ld -lpsm_infinipath --verbose
#ld -lrdmacm --verbose
#ld -libverbs --verbose
#ld -lnl-3 --verbose
#ld -lnl-route-3 --verbose
#ld -lnl-route-3 --verbose
#rpm -ql libpsm2
#rpm -ql libpsm_infinipath
#rpm -ql librdmacm
#rpm -ql libibverbs
#rpm -ql libnl-3
#rpm -ql libnl-route-3
#sudo ln -s /usr/lib64/libpsm2.so.2 /usr/lib64/libpsm2.so
#sudo ln -s /usr/lib64/libpsm_infinipath.so.1 /usr/lib64/libpsm_infinipath.so
#sudo ln -s /usr/lib64/librdmacm.so.1 /usr/lib64/librdmacm.so
#sudo ln -s /usr/lib64/libibverbs.so.1 /usr/lib64/libibverbs.so
#sudo ln -s /usr/lib64/libnl-3.so.200 /usr/lib64/libnl-3.so
#sudo ln -s /usr/lib64/libnl-route-3.so.200 /usr/lib64/libnl-route-3.so

