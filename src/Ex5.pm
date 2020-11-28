#!/usr/bin/perl
=comment
Por ultimo usamos los programas getorf y patmatmotifs de emboss sobre la
secuencia para eso podemos usar el archivo fasta conseguimos de 0.pm.

Para que el script funcione primero tendiamos que usar prosextract sobre
el directorio donde se encuentren los archivos prosite.dat y prosite.doc
pero en la imagen esto ya se hizo y se puede usar directamente.

$ perl Ex5.pm NM_032409.3.gb
=cut

($in) = @ARGV;

use Bio::Factory::EMBOSS;
use Bio::SeqIO;
use Bio::DB::GenBank;

$emboss = new Bio::Factory::EMBOSS;
$mrna = Bio::SeqIO->new(-file => $in)->next_seq;

$out = $in =~ s/\.(fasta|gb)$/.orfs.fasta/ri;
$emboss->program("getorf")->run({-sequence => $mrna, -outseq => $out});
print("ORFs: $out\n");

$out =~ s/\.orfs\.fasta$/.patmatmotifs/i;
$emboss->program("patmatmotifs")->run({-sequence => $mrna, -outfile => $out});
print("patmatmotifs: $out\n\n");
