#!/bin/bash

tmp_file=${1}.tmp
encoding=`file -b --mime-encoding ${1}`
echo file: ${1}
echo encoding: from ${encoding} to utf-8

iconv -f ${encoding} -t utf-8 ${1} > ${tmp_file} \
    && cp ${tmp_file} ${1} \
    && rm ${tmp_file} \
    && echo ok
