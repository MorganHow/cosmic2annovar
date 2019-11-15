#!/bin/bash
# ./cosmic2annovar.sh mail:passwd

for i in "CosmicCodingMuts.vcf.gz" "CosmicNonCodingVariants.vcf.gz"
do
    curl $(curl -H "Authorization: Basic $(echo "$1" | base64)" https://cancer.sanger.ac.uk/cosmic/file_download/GRCh37/cosmic/v90/VCF/$i | awk -F '"' '{print $4}') -o $i
done 


for i in "CosmicMutantExport.tsv.gz" "CosmicNCV.tsv.gz"
do
    curl $(curl -H "Authorization: Basic $(echo "$1" | base64)" https://cancer.sanger.ac.uk/cosmic/file_download/GRCh37/cosmic/v90/$i | awk -F '"' '{print $4}') -o $i
done

gunzip *.gz

./prepare_annovar_user.pl -dbtype cosmic CosmicMutantExport.tsv -vcf CosmicCodingMuts.vcf >hg19_cosmic90.txt
./prepare_annovar_user.pl -dbtype cosmic CosmicNCV.tsv -vcf CosmicNonCodingVariants.vcf >>hg19_cosmic90.txt

sort -V hg19_cosmic90.txt >hg19_cosmic90_sort.txt

mv hg19_cosmic90_sort.txt hg19_cosmic90.txt

./index_annovar.pl hg19_cosmic90.txt 1000
