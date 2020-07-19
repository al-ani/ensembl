#!/usr/bin/env perl
use Bio::EnsEMBL::Registry;
use Getopt::Long;


my $chromosome = 10;
my $start = 25000;
my $end = 30000;
my $fromGenomeVersion = "GRCh38";
my $toGenomeVersion = "GRCh37";
my $help = '';

if ( !GetOptions( 'c=s' => \$chromosome,
                  's=i' => \$start,
                  'e=i' => \$end,
                  'fgv=s' => \$fromGenomeVersion,
                  'tgv=s' => \$toGenomeVersion,
                  'help|h!' => \$help )
     || !( defined($chromosome) && defined($start) && defined($end))
     || $help )

{
print <<HELP;
Usage:
  main.pm  -c chromosome - start -e end [-fgv from_genome_version] [-tgv to_genome_version]
    -c  	Chromosome name, is number between 1 - 22 or x and y (by default 10)
    -s  	Chromosome region start (by default 25000)
    -e  	Chromosome region end (by default 30000)
    -e  	Genome Version such as GRCh37 and GRCh38 (by default GRCh38)
    -e  	Genome Version such as GRCh37 and GRCh38 (by default GRCh37)
    --help / -h  for help.
Example usage:
  main.pm 
  main.pm -c 1 -s 25000 -e 30000
  main.pm -c 1 -s 25000 -e 30000 -fgv GRCh38 -tgv GRCh37
HELP
  exit(0);
} 

# Public Ensembl Database Connection
my $ensembldb_conn = 'Bio::EnsEMBL::Registry';
$ensembldb_conn->load_registry_from_db(
	-host => 'ensembldb.ensembl.org',
	-user => 'anonymous',
	-port => 3337
);

# get a slice adaptor for the human core database
my $slice_adaptor = $ensembldb_conn->get_adaptor( 'Human', 'Core', 'Slice' );

# Obtain a slice covering the chromosome x from $start to $end 
my $slice = $slice_adaptor->fetch_by_region( 'chromosome', $chromosome, $start, $end, '1', $fromGenomeVersion );

my $projection = $slice->project('chromosome', $toGenomeVersion);

print "The region $chromosome:$start..$end in $fromGenomeVersion has ".scalar @$projection." regions in $toGenomeVersion:\n";

foreach my $segment (@$projection) {
    my $to_name = $segment->to_Slice()->seq_region_name();
    my $to_start   = $segment->to_Slice()->start();
    my $to_end     = $segment->to_Slice()->end();
    print (($fromGenomeVersion,':',$chromosome,':', $start + $segment->from_start() - 1), '..', ($start + $segment->from_end() - 1), ' -> ', "$toGenomeVersion:$to_name:$to_start..$to_end\n" );
}
