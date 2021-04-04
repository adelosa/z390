#!/bin/bash
# runcbltests: run z390 zcobol sample regression tests
#
# Note: run from z390/bash directory

# extract longest substring that ends with "/"
dir=${0%/*}

# get the z390 directory
zdir=$(dirname $0)
zdir=$(cd $zdir && pwd)
zdir=$(dirname $zdir)

cd ..

${dir}/bash/cblclg.sh zcobol/tests/TESTADD1 $1 $2 $3 $4 $5 $6 $7 $8 $9
${dir}/bash/cblclg.sh zcobol/tests/TESTADD2 $1 $2 $3 $4 $5 $6 $7 $8 $9
${dir}/bash/cblclg.sh zcobol/tests/TESTIF1 $1 $2 $3 $4 $5 $6 $7 $8 $9
${dir}/bash/cblclg.sh zcobol/tests/TESTIF2 $1 $2 $3 $4 $5 $6 $7 $8 $9
${dir}/bash/cblclg.sh zcobol/tests/TESTIF3 $1 $2 $3 $4 $5 $6 $7 $8 $9
${dir}/bash/cblclg.sh zcobol/tests/TESTMOV1 $1 $2 $3 $4 $5 $6 $7 $8 $9
${dir}/bash/cblclg.sh zcobol/tests/TESTMOV2 $1 $2 $3 $4 $5 $6 $7 $8 $9
${dir}/bash/cblclg.sh zcobol/tests/TESTMOV3 $1 $2 $3 $4 $5 $6 $7 $8 $9

echo "Verify ZCOBOL regression tests"
