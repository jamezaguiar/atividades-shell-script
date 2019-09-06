#!/bin/bash
email=$1
grep $1 emails_database.txt | cut -f1 -d:
