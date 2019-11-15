#!/bin/bash
#
# (no -vcfinput) and (with -otherinfo) for report.xls

annovar=/opt/biosoft/annovar_20180416

perl $annovar/table_annovar.pl $1 ./ \
    -buildver hg19 \
    -remove \
    -protocol cosmic90 \
    -operation f \
    -nastring . \
    -otherinfo \
    -out ${1%.xls} \
    -polish -xref $annovar/example/gene_xref.txt
