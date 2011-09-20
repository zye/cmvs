############################################
# setting environment variables
############################################

source ../settings64.sh
echo $CMVS_TOP

############################################
# install graclus
############################################

cd $CMVS_CORE/graclus
cd graclus1.2
make


# if GPU is there, use siftgpu
if `test -e /usr/lib/libcuda.so`; then

############################################
# install siftgpu
############################################

cd $CMVS_CORE/siftgpu
cd ./SiftGPU
make
cd bin
./loweSIFT.sh

else # else use siftpp for CPU

############################################
# install siftpp
############################################

cd $CMVS_CORE/siftpp
cd siftpp
make

fi # end GPU/CPU branch

############################################
# install bundler
############################################

cd $CMVS_CORE/bundler
cd bundler-v0.4-source
make

############################################
# install cmvs and pmvs
############################################

cd $CMVS_CORE/cmvs-pmvs
cd ./pmvs-2/program/main/
make


