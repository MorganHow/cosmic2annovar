# 1. register cosmic with your edu email
https://cancer.sanger.ac.uk/cosmic/register  

# 2. download database and prepare for annovar 
./cosmic2annovar.sh mail:passwd

# 3. test the tsv file
./cosmic_anno.sh test.report.xls
