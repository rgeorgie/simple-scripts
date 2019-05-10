#!/bin/bash
# I'm Sure there thousands of scripts like this one,
# but got bored today
# Subzer0 May 10, 2019

SyM="*" #the frame symbol
Ban3="Some text here" #change it for every banner

# set is as function:
MsG(){
NuM=$(expr length "$Ban3"); #count the symbols in banner
printf "%.s$SyM" $(seq 1 $NuM); #Print SyM multiplied by NuM
echo -e "\n$Ban3";
printf "%.s$SyM" $(seq 1 $NuM);
echo; # need it
}

# SAMPLE:

SyM="#"
Ban3="$SyM First try `date` $SyM"
MsG;

SyM="*"
Ban3="$SyM Second try at `date` Cheers! $SyM"
MsG;

SyM="&"
Ban3="$SyM Test 3 `date` Subzer0 $SyM"
MsG;