#!/bin/bash
COMANDO=$1
if [ "$COMANDO" = "start" ]
then
	echo Iniciando Serviço
elif [ "$COMANDO" = "stop" ]
then
	echo Parando Serviço
elif [ "$COMANDO" = "restart" ]
then
	echo Reiniciando Serviço
else
	echo "Uso: ./servico.sh (start|stop|restart)"
fi
