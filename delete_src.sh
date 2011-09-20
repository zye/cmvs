############################################
# setting environment variables
############################################

source settings64.sh
echo $CMVS_TOP

############################################
# delete source packages
############################################

rm -rf $CMVS_CORE/siftgpu/SiftGPU
rm -rf $CMVS_CORE/siftpp/siftpp
rm -rf $CMVS_CORE/bundler/bundler-v0.4-source
rm -rf $CMVS_CORE/graclus/graclus1.2
rm -rf $CMVS_CORE/cmvs-pmvs/cmvs
rm -rf $CMVS_CORE/cmvs-pmvs/pmvs-2


