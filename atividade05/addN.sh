#!/bin/bash
somar=$*
echo $somar | tr ' ' '+' | bc
