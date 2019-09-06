#!/bin/bash
dominio=$1
users=`grep $1 emails_database.txt | wc -l`
echo Existem $users usuários com esse domínio de email, sendo eles:
grep $1 emails_database.txt | cut -f1 -d:
