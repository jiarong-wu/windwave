#!/bin/bash
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=16
#SBATCH --time=20:00:00
#SBATCH --mail-type=begin
#SBATCH --mail-type=end
#SBATCH --mail-user=jiarongw@princeton.edu

#The executable name
EXE=turbulence_RE
#Parameter value
LEVEL=7
RE=64000 #Default 40000
START=0
END=200


export ScratchDir="/scratch/gpfs/jiarongw/turbulence/RE${RE}LEVEL${LEVEL}START${START}END${END}"
echo $ScratchDir
#Copy the executable from executable directory
cp /scratch/gpfs/jiarongw/executable/f$EXE/$EXE $ScratchDir
cd $ScratchDir
cp ./dump300 ./restart
srun ./$EXE $RE $LEVEL $START $END 

#To move the whole directory to /tigress
#cp -r $ScratchDir /tigress/jiarongw/
#rm -rf $ScratchDir
