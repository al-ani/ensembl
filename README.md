# Requirement 
The code requires the Ensembl library are installed, as described in the installation instructions http://asia.ensembl.org/info/docs/api/api_installation.html. 


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



# Alternative
The alternative method uses RESTful API NEWLINE
**Requirement:** Required to install HTTP::Tiny and JSON library
For HTTP::Tiny https://metacpan.org/pod/HTTP::Tiny
For JSON https://metacpan.org/pod/JSON


# Alternative Usage 
    perl rest.pm [-c chromosome] [-s start] [-e end] [-fgv fromGenomeVersion] [-tgv toGenomeVersion]
        -c  	Chromosome name, is number between 1 - 22 or x and y (by default 10)
        -s  	Chromosome region start (by default 25000)
        -e  	Chromosome region end (by default 30000)
        -fgv  	Genome Version such as GRCh37 and GRCh38 (by default GRCh38)
        -tgv  	Genome Version such as GRCh37 and GRCh38 (by default GRCh37)
        --help / -h  for help
# Alternative  Examples
    perl rest.pm -c 1 -s 25000 -e 30000 -fgv GRCh38 -tgv GRCh37
    perl rest.pm -c X -s 25000 -e 30000 
