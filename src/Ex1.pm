#!/usr/bin/perl
=comment
Elegimos como enfermedad a investigar el parkinson, una enfermedad progresiva
que afecta el sistema motriz.

Para ello buscamos en omim: https://www.omim.org/search?index=entry&start=1&limit=10&sort=score+desc%2C+prefix_sort+desc&search=parkinson
El primer resultado es: https://www.omim.org/entry/605909?search=parkinson&highlight=parkinson

El gen conocido como PARK6 es una mutacion del gen PINK1
asi que decidimos estudiar este ultimo.

En ncbi: https://www.ncbi.nlm.nih.gov/gene/65018
Del cual tenemos el mRNA: https://www.ncbi.nlm.nih.gov/nuccore/NM_032409.3
Podemos usar el script 0 para obtener el archibo gb: perl 0.pl NM_032409.3

Bio::Seq->translate
  start => "atg"  codon de inicio
  complete => 1   sequencia completa
  orf => 1        encontrar el open reading frame

Se puede confirmar el resultado con el accession en ORFFinder
https://www.ncbi.nlm.nih.gov/orffinder/
En el caso de NM_032409.3 es el orf 3 frame 2

$ perl Ex1.pm NM_032409.3.gb
=cut

($in) = @ARGV;
$out = $in =~ s/.gb$/.fasta/ri;

use Bio::SeqIO;

$mrna = Bio::SeqIO->new(-file => $in, -format => "genbank")->next_seq;
$prot = $mrna->translate(-start => "atg", -complete => 1, -orf => 1);
Bio::SeqIO
  ->new(-file => ">".$out, -format => "fasta")
  ->write_seq($prot);
print "Fasta: $out\n".$prot->seq."\n\n";
