############################################
# setting environment variables
############################################

source settings64.sh

# if GPU is there, use siftgpu
if `test -e /usr/lib/libcuda.so`; then

############################################
# test siftgpu
############################################

cd $CMVS_CORE/siftgpu
cd ./SiftGPU
cd bin
./loweSIFT.sh

else # else use siftpp for CPU

:

fi # end GPU/CPU branch

############################################
# test bundler
############################################

cd $CMVS_CORE/bundler
cd ./bundler-v0.4-source
./RunBundler.sh ./examples/ET/
if `test -e ./bundle/bundle.out`; then
	echo "test passed";
else
	echo "test failed"
fi

cd $CMVS_CORE/bundler
cd ./bundler-v0.4-source
./bin/Bundle2PMVS ./list.txt ./bundle/bundle.out
chmod +x ./pmvs/prep_pmvs.sh
./pmvs/prep_pmvs.sh
if `test -e ./pmvs/bundle.rd.out`; then
	echo "test passed";
else
	echo "test failed"
fi

############################################
# test cmvs-pmvs
############################################

cd $CMVS_CORE/bundler
cd ./bundler-v0.4-source
cmvs ./pmvs/
if `test -e ./pmvs/centers-all.ply`; then
	echo "test passed";
else
	echo "test failed"
fi
genOption ./pmvs/
if `test -e ./pmvs/pmvs.sh`; then
	echo "test passed";
else
	echo "test failed"
fi
sh ./pmvs/pmvs.sh
if `test -e ./pmvs/models/option-*.ply`; then
	echo "test passed";
else
	echo "test failed"
fi


