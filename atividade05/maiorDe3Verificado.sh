#!/bin/bash
PRIMEIRO=$1
SEGUNDO=$2
TERCEIRO=$3
MAIOR=$PRIMEIRO

#Verificação SE é número
expr $PRIMEIRO + 1 > /dev/null 2> /dev/null
if [ $? -gt 0 ]
then
	echo Opa!!! $PRIMEIRO não é número
	exit 1
fi

expr $SEGUNDO + 1 > /dev/null 2> /dev/null
if [ $? -gt 0 ]
then
	echo Opa!!! $SEGUNDO não é número
	exit 1
fi

expr $TERCEIRO + 1 > /dev/null 2> /dev/null
if [ $? -gt 0 ]
then
	echo Opa!!! $TERCEIRO não é número
	exit 1
fi


#Verificação de quem é o maior
if [ $SEGUNDO -gt $PRIMEIRO ] && [ $SEGUNDO -gt $TERCEIRO ]
then
	MAIOR=$SEGUNDO
fi

if [ $TERCEIRO -gt $PRIMEIRO ] && [ $TERCEIRO -gt $SEGUNDO ]
then
	MAIOR=$TERCEIRO
fi

echo $MAIOR
