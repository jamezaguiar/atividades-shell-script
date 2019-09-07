#!/bin/bash
notas=$*
soma=`echo $* | tr ' ' '+' | bc`
media=`echo $soma/$# | bc`
show=`echo $notas | tr ' ' '\n' | sort -n`
menor=`echo $show | tr ' ' '\n' | head -n 1`
maior=`echo $show | tr ' ' '\n' | tail -n 1`
echo O menor valor digitado foi $menor
echo O maior valor digitado foi $maior
echo A média aritmética dos valores digitados foi $media
