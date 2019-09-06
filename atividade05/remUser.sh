#!/bin/bash
email=$1
sed -i '/'$email'/d' emails_database.txt
