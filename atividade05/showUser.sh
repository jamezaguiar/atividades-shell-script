#!/bin/bash
email=$1
grep $email emails_database.txt | cut -f1 -d:
