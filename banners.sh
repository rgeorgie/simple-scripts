#!/bin/bash

MsG(){
NuM=$(expr length "$Ban3");
printf '%.s=' $(seq 1 $NuM);
echo -e "\n$Ban3";
printf '%.s=' $(seq 1 $NuM);
echo;
}

Ban3="= First try Subzer0 `date` ="
MsG;

Ban3="= Second try at `date` Subzer0 ="
MsG;

Ban3="= Test 3 `date` ="
MsG;
