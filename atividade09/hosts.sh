#!/bin/bash

adicionar() {
   echo "$1:$2" >>hosts.db
}

remover() {
   sed -i '/^'$1'.*/d' hosts.db
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

menu() {
   printf "==================== MENU ====================\nAdicionar Host: ./hosts.sh -a <nome> -i <ip>\n\t\t./hosts.sh -i <ip> -a <nome>\nRemover Host:\t./hosts.sh -d <nome>\nBusca:\t\t./hosts.sh <nome>\nBusca Reversa:\t./hosts.sh -r <ip>\nListar Hosts:\t./hosts.sh -l\n"
   read -p "Digite o comando desejado conforme instruções: " COMANDO
   bash $COMANDO
}

getopts "a:i:r:d:l" OPTVAR

case "$OPTVAR" in
"a")
   nome=$OPTARG
   getopts "a:i:r:d:l" OPTVAR
   if [ "$OPTVAR" == "i" ]; then
      IP=$OPTARG
   else
      echo "USO CORRETO: -a <nome> -i <ip>"
      exit 1
   fi
   adicionar $nome $IP
   ;;
"i")
   IP=$OPTARG
   getopts "a:i:r:d:l" OPTVAR
   if [ "$OPTVAR" == "a" ]; then
      nome=$OPTARG
   else
      "USO CORRETO: -i <ip> -a <nome>"
      exit 1
   fi
   adicionar $nome $IP
   ;;
"l")
   listar
   exit 0
   ;;
"d")
   remover $OPTARG
   exit 0
   ;;
"?")
   if [[ $1 =~ ^([A-Za-z0-9]+)$ ]]; then
      procurar $1
      exit 0
   else
      menu
   fi
   ;;
"r")
   reverso $OPTARG
   exit 0
   ;;
*)
   menu
   ;;
esac
