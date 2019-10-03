#!/bin/bash
read -p "Informe o arquivo: " NOMEARQ
declare -A vet
for i in `cat $NOMEARQ | sed 's/[[:punct:]]//g' | tr ' ' '\n'`
do
  if [ -z ${vet[$i]} ]
  then
    vet[$i]=1
  else
    vet[$i]=`echo ${vet[$i]} + 1 | bc`
  fi
done

for j in `echo ${!vet[@]}`
do
  printf "%s:\t%d\n" $j ${vet[$j]} >> showResult.txt
done

cat showResult.txt | sort -k2 -nr
rm showResult.txt