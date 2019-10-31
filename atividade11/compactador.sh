#!/bin/bash
function cancelVerify() {
  if [ "$?" -ne 0 ]; then
    dialog --title "CANCELADO" --infobox "Operação cancelada pelo usuário" 0 0
    if [ -e arqs.txt ]; then
      rm arqs.txt
    fi
    sleep 5
    exit 1
  fi
}

NOMEDIR=$(dialog --title "CAMINHO" --inputbox "Digite o caminho do diretório dos arquivos que serão compactados:" 0 0 --stdout)
cancelVerify
if [ ! -d "$NOMEDIR" ]; then
  dialog --title "FALHA" --infobox "Não foi possível encontrar o diretório especificado, tente novamente." 0 0
  sleep 5
  exit 1
fi

NOMEDIRF=$(echo $NOMEDIR | sed 's/\//\\\//g')
COUNT=1
for i in $(find $NOMEDIR -maxdepth 1 -type f | sed "s/$NOMEDIRF\///g"); do
  echo "$i $COUNT off" >>arqs.txt
  COUNT=$((COUNT + 1))
done

declare -a ARQS
ARQS=$(
  dialog \
    --title "Seleção de Arquivos" \
    --checklist "Escolha os arquivos que serão compactados" \
    0 0 0 \
    $(cat arqs.txt) \
    --stdout
)
cancelVerify

COMPACT=$(
  dialog \
    --menu "Escolha a forma de compactação" \
    0 0 0 \
    1 "gzip" \
    2 "bzip2" \
    --stdout
)
cancelVerify

NOMEARQCOMPACT=$(
  dialog \
    --inputbox "Digite o nome do novo arquivo compactado" \
    0 0 \
    --stdout
)
cancelVerify

cd $NOMEDIR
case $COMPACT in
1)
  tar -czvf $(echo $NOMEARQCOMPACT.tar) ${ARQS[@]}
  gzip $(echo $NOMEARQCOMPACT.tar)
  NAMEFINAL=$(echo $NOMEARQCOMPACT.tar.gz)
  ;;
2)
  tar -czvf $(echo $NOMEARQCOMPACT.tar) ${ARQS[@]}
  bzip2 $(echo $NOMEARQCOMPACT.tar)
  NAMEFINAL=$(echo $NOMEARQCOMPACT.tar.bz2)
  ;;
*)
  dialog --title "FALHA" --infobox "Algo deu errado, tente novamente." 0 0
  sleep 5
  exit 1
  ;;
esac

dialog --title "SUCESSO" --infobox "Nome do arquivo compactado: $NAMEFINAL" 0 0
sleep 5

cd -
clear
rm arqs.txt
