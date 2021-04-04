#!/bin/bash

# z390: start z390 GUI in background

# debug flag; 0=no
debug=0

# get full directory path to z390.jar; assumes that this script is in the z390/bash subdirectory
jardir=$(dirname $0)
jardir=$(cd $jardir && pwd)
jardir=$(dirname $jardir)

if [ $debug -eq 1 ]; then echo "jardir=$jardir"; fi
if [ $debug -eq 1 ]; then echo -n "before cd jardir: pwd="; pwd; fi
cd $jardir
if [ $debug -eq 1 ]; then echo -n "after  cd jardir: pwd="; pwd; fi

# uncomment next line if java is in your path; else uncomment the following line
java="java";
#java=$(which java);

if [ $debug -eq 1 ]; then echo "java=$java"; fi

cmd="$java -jar ${jardir}/z390.jar"

$cmd &
if [ $debug -eq 1 ]; then echo "z390 GUI started in background"; fi
