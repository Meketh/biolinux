#!/usr/bin/perl
=comment
Obtiene el gb y fasta por accession
$ perl 0.pm NM_032409.3
=cut

($id) = @ARGV;
$gb = Bio::DB::GenBank->new;

use Bio::SeqIO;
use Bio::DB::GenBank;

$mrna = $gb->get_Seq_by_id($id);

Bio::SeqIO
  ->new(-file => ">$id.gb", -format => "genbank")
  ->write_seq($mrna);
print("GenBank: $id.gb\n");

Bio::SeqIO
  ->new(-file => ">$id.fasta", -format => "fasta")
  ->write_seq($mrna);
print("Fasta: $id.fasta\n", $mrna->seq, "\n\n");
