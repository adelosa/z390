#!/bin/bash

# assist: assemble, link, and exec ASSIST program $1.MLC 

# extract longest substring that ends with "/"
dir=${0%/*}

export XREAD=$1.XRD
export XPRNT=$1.XPR
export XPNCH=$1.XPH
export XGET=$1.XGT
export XPUT=$1.XPT

${dir}/asmlg.sh $1 ASSIST $2 $3 $4 $5 $6 $7 $8 $9

