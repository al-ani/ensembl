use Getopt::Long;
use HTTP::Tiny;
use JSON;
use Data::Dumper;

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
    -fgv  	Genome Version such as GRCh37 and GRCh38 (by default GRCh38)
    -tgv  	Genome Version such as GRCh37 and GRCh38 (by default GRCh37)
    --help / -h  for help.
Example usage:
  main.pm 
  main.pm -c 1 -s 25000 -e 30000
  main.pm -c 1 -s 25000 -e 30000 -fgv GRCh38 -tgv GRCh37
HELP
  exit(0);
} 

my $http = HTTP::Tiny->new();
my $domain = 'http://grch37.rest.ensembl.org';
my $path = "/map/human/$fromGenomeVersion/$chromosome:$start..$end/$toGenomeVersion?";


my $response = $http->get($domain.$path, {
  headers => { 'Content-type' => 'application/json' }
});
die "Connection Error\n" unless $response->{success};
 

if(length $response->{content}) {
  local $hash = decode_json($response->{content});
  print(Dumper $hash)
}

