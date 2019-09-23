#!/bin/bash
ARQUIVO=$1
for ip in `cat $ARQUIVO`
do
	MEDIA=`ping -c10 $ip | tail -n 1 | cut -f5 -d'/'`
	echo $ip $MEDIA'ms'>> resposta.txt
done
cat resposta.txt | sort -k2 -n > respostaordenada.txt
cat respostaordenada.txt
rm resposta.txt
rm respostaordenada.txt
