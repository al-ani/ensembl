# Prerequisites 
The script requires the [Ensembl Api Reference](http://grch37.rest.ensembl.org/) library installed

# Usage
    perl main.pm [-c chromosome] [-s start] [-e end] [-fgv fromGenomeVersion] [-tgv toGenomeVersion]
        -c  	Chromosome name, is number between 1 - 22 or x and y (by default 10)
        -s  	Chromosome region start (by default 25000)
        -e  	Chromosome region end (by default 30000)
        -fgv  	Genome Version such as GRCh37 and GRCh38 (by default GRCh38)
        -tgv  	Genome Version such as GRCh37 and GRCh38 (by default GRCh37)
        --help / -h  for help
# Examples
    perl main.pm -c 1 -s 25000 -e 30000 -fgv GRCh38 -tgv GRCh37
    perl main.pm -c X -s 25000 -e 30000 


# Alternative Method
The alternative method uses RESTful API 
**Prerequisites:**  The script requires [HTTP::Tiny](https://metacpan.org/pod/HTTP::Tiny) [JSON](https://metacpan.org/pod/JSON) libraries installed



# Alternative Method Usage 
    perl rest.pm [-c chromosome] [-s start] [-e end] [-fgv fromGenomeVersion] [-tgv toGenomeVersion]
        -c  	Chromosome name, is number between 1 - 22 or x and y (by default 10)
        -s  	Chromosome region start (by default 25000)
        -e  	Chromosome region end (by default 30000)
        -fgv  	Genome Version such as GRCh37 and GRCh38 (by default GRCh38)
        -tgv  	Genome Version such as GRCh37 and GRCh38 (by default GRCh37)
        --help / -h  for help
# Alternative Method  Examples
    perl rest.pm -c 1 -s 25000 -e 30000 -fgv GRCh38 -tgv GRCh37
    perl rest.pm -c X -s 25000 -e 30000 