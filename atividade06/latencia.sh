#!/bin/bash
ARQUIVO=$1
for ip in `cat $ARQUIVO`
do
	SOMA=`ping -c10 $ip | tail -n 14 | head -n 10 | cut -f7 -d' ' | cut -f2 -d'=' | tr '\n' '+' | sed 's/+$/\n/' | bc`
	MEDIA=`echo "scale=2;$SOMA/10" | bc`
	echo $ip >> resposta.txt
	echo $MEDIA >> resposta.txt
done
cat resposta.txt
rm resposta.txt
