#!/bin/bash
INTERVALO=$1
DIRETORIO=$2
ls $DIRETORIO > oldfiles.txt
while true
do
	DATETIME=`date +%d-%m-%Y' '%H:%M:%S`
	SHOW=`echo [$DATETIME]`
	ls $DIRETORIO > newfiles.txt
	ANTES=`cat oldfiles.txt | wc -l`
	AGORA=`cat newfiles.txt | wc -l`
	comm -1 -3 oldfiles.txt newfiles.txt > adicionados.txt
	comm -2 -3 oldfiles.txt newfiles.txt > removidos.txt

	if [ ! -z `cat adicionados.txt | head -n 1` ]
	then
		echo $SHOW Alteração! $ANTES'->'$AGORA'.' Adicionados: `cat adicionados.txt | tr '\n' ', ' | sed 's/,/, /g' | sed 's/, $/\n/'` >> dirSensors.log
		cat dirSensors.log | tail -n 1
		cat newfiles.txt > oldfiles.txt
	fi

	if [ ! -z `cat removidos.txt | head -n 1` ]
	then
		echo $SHOW Alteração! $ANTES'->'$AGORA'.' Removidos: `cat removidos.txt | tr '\n' ', ' | sed 's/,/, /g' | sed 's/, $/\n/'` >> dirSensors.log
		cat dirSensors.log | tail -n 1
		cat newfiles.txt > oldfiles.txt
	fi

	rm adicionados.txt
	rm removidos.txt
	sleep $INTERVALO

	trap ctrl_c INT
	function ctrl_c() {
		rm oldfiles.txt
		rm newfiles.txt
		echo '-----------------------------------------------------------------------------------' >> dirSensors.log
		exit 1
	}
done
