#!/usr/bin/perl
=comment
Ahora usamos blast+ de ncbi para obtener el reporte blast de la secuencia del Ex1
En la imagen provista el container tiene la db swissprot en la ruta /db/swissprot
y ya esta lista para ser usada.

Dejamos comentada la forma de hacerlo remotamente eusando las db del ncbi,
pero no esta funcionando debido a un conflicto de versiones que no pudimos resolver.

$ perl Ex2.pm NM_032409.3.fasta
=cut

($in) = @ARGV;
$out = $in =~ s/.fasta$/.blast/ri;

use Bio::SeqIO;
use Bio::Tools::Run::StandAloneBlastPlus;

Bio::Tools::Run::StandAloneBlastPlus
  ->new(-db_name => "/db/swissprot")
  # ->new(-db_name => "swissprot", -remote => 1) # NOT WORKING
  ->blastp(-query => $in, -outfile => $out);
print("Blast: $out\n\n");
