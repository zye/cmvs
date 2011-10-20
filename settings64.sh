###############################################################################
#
# You need to set these variables before doing anything:
#
# 1. CMVS_TOP
# 2. CMVS_DEP
# 3. USE_SIFTGPU / USE_SIFTPP
#
###############################################################################


###############################################################################
# 
# 1. CMVS_TOP
#
# specify the top directory of the cmvs, where the settings64.sh locates
# i.e., if you have /home/cudauser/application4/cmvs_v0.0.02/settings64.sh
# export CMVS_TOP=/home/cudauser/application4/cmvs_v0.0.02
#
###############################################################################

export CMVS_TOP=
if `test -e $CMVS_TOP/settings64.sh` ; then 
	echo $CMVS_TOP;
else 
	echo Please set CMVS_TOP in settings64.sh ; 
	return; 
fi

###############################################################################
# 
# 2. CMVS_DEP
#
# The path to the dependenies of CMVS.
# This script assumes the dependencies are located in the same path.
# This script assumes the following packages are located in the path:
# 1) glew 1.5.2
# 2) libtool 2.2.6b
# 3) imagemagick 6.5.78
# 4) devil 1.7.8
# 5) jhead 2.88
# 6) clapack 3.2.1 (threadsafe)
# 7) gsl 1.15
#
# You may need to add or remove dependent packages according to your system
#
###############################################################################

# example: export CMVS_DEP=/home/cudauser/application4/cmvs_dep

export CMVS_DEP=
if `test -e $CMVS_DEP/settings64.sh` ; then 
	source $CMVS_DEP/settings64.sh ;
	echo $CMVS_TOP; 
else
	echo Please set CMVS_DEP in settings64.sh ; 
	return; 
fi

###############################################################################
# 
# 3. USE_SIFTGPU / USE_SIFTPP
#
# specify which sift software to use
# 1. siftgpu, a gpu version of sift
# 2. siftpp, a cpu version of sift
#
###############################################################################

export USE_SIFTGPU=1
export USE_SIFTPP=0 

# core path
export CMVS_CORE=$CMVS_TOP/core

# graclus
export PATH=$PATH:$CMVS_CORE/graclus/graclus1.2
export C_INCLUDE_PATH=$C_INCLUDE_PATH:$CMVS_CORE/graclus/graclus1.2/metisLib
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$CMVS_CORE/graclus/graclus1.2/metisLib
export LIBRARY_PATH=$LIBRARY_PATH:$CMVS_CORE/graclus/graclus1.2
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CMVS_CORE/graclus/graclus1.2

# siftgpu
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CMVS_CORE/siftgpu/SiftGPU/bin

# bundler
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CMVS_CORE/bundler/bundler-v0.4-source/lib
export BUNDLER_BIN_PATH=$CMVS_CORE/bundler/bundler-v0.4-source/bin

# cmvs-pmvs
export PATH=$PATH:$CMVS_CORE/cmvs-pmvs/pmvs-2/program/main

