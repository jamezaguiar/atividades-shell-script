#!/bin/bash

adicionar() {   
   echo "$1:$2" >> hosts.db	
}

remover() {
   set -xv
   sed -i '/^'$1'.*/d' hosts.db 	
   set +xv
}

procurar() {
   grep $1 hosts.db | cut -f2 -d':'	
}

reverso() {
   grep $1 hosts.db | cut -f1 -d':'	
}

listar() {
   cat hosts.db | tr ':' ' '	
}

getopts "a:i:r:d:l" OPTVAR
case "$OPTVAR" in
   "a") nome=$OPTARG
	getopts "a:i:r:d:l" OPTVAR
	if [ "$OPTVAR" == "i" ]
        then
           IP=$OPTARG
        else    
           echo "Está errado, babaca..."		
	   exit 1
        fi
	adicionar $nome $IP
	;;
   "i") IP=$OPTARG
	getopts "a:i:r:d:l" OPTVAR
	if [ "$OPTVAR" == "a" ]
        then
           nome=$OPTARG
        fi
	adicionar $nome $IP
	;;
   "l") listar
        exit 0     
        ;;
   "d") remover $OPTARG
        ;;
"r") reverso $OPTARG
	exit 0
	;;
"") procurar $OPTARG
	exit 0
	;;
*) echo Menu em construção!
esac








