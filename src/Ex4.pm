#!/usr/bin/perl
=comment
Usa una regex para buscar en la descripcion de los resultados del blast.

$ perl Ex4.pm NM_032409.3.blast 'mus musculus'
=cut

($in, $pattern) = @ARGV;

use Bio::SearchIO;
use Bio::SeqIO;
use Bio::DB::GenBank;
use Bio::DB::Query::GenBank;

@ids = ();
$blast = new Bio::SearchIO(-file => $in, -format => "blast");
while ($result = $blast->next_result) {
  while ($hit = $result->next_hit) {
    if ($hit->description =~ m/$pattern/i) {
      push(@ids, $hit->accession);
    }
  }
}

$fasta = Bio::SeqIO->new(-file => ">$pattern.fasta", -format => "fasta");
$stream = Bio::DB::GenBank->new->get_Stream_by_query(
  Bio::DB::Query::GenBank->new(-ids => \@ids)
);
while ($seq = $stream->next_seq) {
  print("Match: ", $seq->id, "\n");
  $fasta->write_seq($seq);
}
print("Search results: $pattern.fasta\n\n");
