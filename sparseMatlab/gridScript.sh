#!/bin/bash

MATLABPATH=/n/sebase/jps/jose/sparseMatlab/shapeFunctions/; export MATLABPATH

#echo $MATLABPATH

/usr/local/bin64/matlab -singleCompThread -nodesktop -r "gridJob $1"
