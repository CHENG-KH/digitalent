# Date: 20200825
# Annovar database download
# Reference genome version: GRCh37/hg19 | GRCh38/hg38
# URL: http://annovar.openbioinformatics.org/en/latest/user-guide/download/
# Hang-on database path: /home/workshop/ngs_tools/annovar/humandb/
#---------------------------

# Creat humandb folder
if [ -d /work1/ACD109058/humandb ]; then
        echo 'humandb folder exist!!'
else mkdir -p /work1/ACD109058/humandb;
        echo 'Create humandb folder done!'
fi

export DB_PATH=/work1/ACD109058/humandb/
export ANN_PATH=/pkg/biology/ANNOVAR/ANNOVAR_20200608/

##### Gene-based #######
# NCBI RefSeq v.201706
$ANN_PATH/annotate_variation.pl -buildver hg19 -downdb -webfrom annovar refGene $DB_PATH
$ANN_PATH/annotate_variation.pl -buildver hg38 -downdb -webfrom annovar refGene $DB_PATH

# UCSC KnownGene v.201706
$ANN_PATH/annotate_variation.pl -buildver hg19 -downdb -webfrom annovar knownGene $DB_PATH
$ANN_PATH/annotate_variation.pl -buildver hg38 -downdb -webfrom annovar knownGene $DB_PATH

# Ensembl Gene v.201706
$ANN_PATH/annotate_variation.pl -buildver hg19 -downdb -webfrom annovar ensGene $DB_PATH
$ANN_PATH/annotate_variation.pl -buildver hg38 -downdb -webfrom annovar ensGene $DB_PATH # based on Gencode v26 Basic collection v.20170912

##### Region-based #####
# UCSC cytoBand
$ANN_PATH/annotate_variation.pl -buildver hg19 -downdb cytoBand $DB_PATH
# UCSC cytoBand hg38
cd $DB_PATH && wget -c http://hgdownload.cse.ucsc.edu/goldenpath/hg38/database/cytoBand.txt.gz && gunzip -d cytoBand.txt.gz && mv cytoBand.txt hg38_cytoBand.txt

# UCSC genomicSuperDups
$ANN_PATH/annotate_variation.pl -buildver hg19 -downdb genomicSuperDups $DB_PATH
# UCSC genomicSuperDups hg38
cd $DB_PATH && wget -c http://hgdownload.cse.ucsc.edu/goldenpath/hg38/database/genomicSuperDups.txt.gz && gunzip -d genomicSuperDups.txt.gz && mv genomicSuperDups.txt hg38_genomicSuperDups.txt

# UCSC phastConsElements100way
$ANN_PATH/annotate_variation.pl -buildver hg19 -downdb phastConsElements100way $DB_PATH
cd $DB_PATH && wget -c http://hgdownload.cse.ucsc.edu/goldenpath/hg38/database/phastConsElements100way.txt.gz && gunzip -d phastConsElements100way.txt.gz && mv phastConsElements100way.txt hg38_phastConsElements100way.txt

##### Filter-based #####
# 1000 Genome v.20150824
$ANN_PATH/annotate_variation.pl -buildver hg19 -downdb -webfrom annovar 1000g2015aug $DB_PATH
$ANN_PATH/annotate_variation.pl -buildver hg38 -downdb -webfrom annovar 1000g2015aug $DB_PATH

# NCBI dbSNP150 v.20170929
$ANN_PATH/annotate_variation.pl -buildver hg19 -downdb -webfrom annovar avsnp150 $DB_PATH
$ANN_PATH/annotate_variation.pl -buildver hg38 -downdb -webfrom annovar avsnp150 $DB_PATH

# NCI60 v.20150428
$ANN_PATH/annotate_variation.pl -buildver hg19 -downdb -webfrom annovar nci60 $DB_PATH
$ANN_PATH/annotate_variation.pl -buildver hg38 -downdb -webfrom annovar nci60 $DB_PATH

# NCBI ClinVar v.20180708
$ANN_PATH/annotate_variation.pl -buildver hg19 -downdb -webfrom annovar clinvar_20180603 $DB_PATH
$ANN_PATH/annotate_variation.pl -buildver hg38 -downdb -webfrom annovar clinvar_20180603 $DB_PATH

# gnomAD genome collection
$ANN_PATH/annotate_variation.pl -buildver hg19 -downdb -webfrom annovar gnomad_genome $DB_PATH
$ANN_PATH/annotate_variation.pl -buildver hg38 -downdb -webfrom annovar gnomad_genome $DB_PATH

# gnomAD exome collection
$ANN_PATH/annotate_variation.pl -buildver hg19 -downdb -webfrom annovar gnomad_exome $DB_PATH
$ANN_PATH/annotate_variation.pl -buildver hg38 -downdb -webfrom annovar gnomad_exome $DB_PATH

# ExAC 65000 exome allele frequency data for ALL, AFR (African), AMR (Admixed American), EAS (East Asian), FIN (Finnish), NFE (Non-finnish European), OTH (other), SAS (South Asian)). version 0.3. Left normalization done.
$ANN_PATH/annotate_variation.pl -buildver hg19 -downdb -webfrom annovar exac03 $DB_PATH
$ANN_PATH/annotate_variation.pl -buildver hg38 -downdb -webfrom annovar exac03 $DB_PATH

# ESP6500 v.20141222
$ANN_PATH/annotate_variation.pl -buildver hg19 -downdb -webfrom annovar esp6500siv2_all $DB_PATH
$ANN_PATH/annotate_variation.pl -buildver hg38 -downdb -webfrom annovar esp6500siv2_all $DB_PATH

# InterVar: clinical interpretation of missense variants (indels not supported) 20180325
$ANN_PATH/annotate_variation.pl -buildver hg19 -downdb -webfrom annovar intervar_20180118 $DB_PATH
$ANN_PATH/annotate_variation.pl -buildver hg38 -downdb -webfrom annovar intervar_20180118 $DB_PATH

# whole-exome SIFT, PolyPhen2 HDIV, PolyPhen2 HVAR, LRT, MutationTaster, MutationAssessor, FATHMM, MetaSVM, MetaLR, VEST, CADD, GERP++, DANN, fitCons, PhyloP and SiPhy scores from dbNSFP (protein domain for variants)
$ANN_PATH/annotate_variation.pl -buildver hg19 -downdb -webfrom annovar dbnsfp31a_interpro $DB_PATH
$ANN_PATH/annotate_variation.pl -buildver hg38 -downdb -webfrom annovar dbnsfp31a_interpro $DB_PATH

# gwasCatalog
$ANN_PATH/annotate_variation.pl -buildver hg19 -downdb -webfrom annovar gwasCatalog $DB_PATH
$ANN_PATH/annotate_variation.pl -buildver hg38 -downdb -webfrom annovar gwasCatalog $DB_PATH