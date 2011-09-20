############################################
# setting environment variables
############################################

source settings64.sh
echo $CMVS_TOP

############################################
# install dependencies
############################################

#cd $CMVS_TOP/dependencies
#./install_dependencies.sh

############################################
# install core
############################################

cd $CMVS_TOP/core
./install_core.sh



