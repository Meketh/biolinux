#!/usr/bin/perl
=comment
Obtiene el MSA de una lista de secuencias
Parametros: nombre del archivo y lista de accession

Para este caso selecionamos los siguientes accession del blast

Q99MQ3.2 [Mus musculus] Ratón casero
W0LYS5.1 [Macrobrachium nipponense] Camarón nipón
Q00168.1 [Drosophila melanogaster] Mosca de la fruta
Q7RAH3.3 [Plasmodium yoelii yoelii] Parasito
P54644.1 [Dictyostelium discoideum] Ameba
Q4V7Q6.1 [Xenopus laevis] Rana de uñas africana

Y le sumamos el de la proteina del mRNA: NP_115785.1 (PINK1 protein)

$ perl Ex3.pm PINK1 NP_115785.1 Q99MQ3.2 W0LYS5.1 Q00168.1 Q7RAH3.3 P54644.1 Q4V7Q6.1
=cut

($out, @ids) = @ARGV;

use Bio::DB::GenBank;
use Bio::DB::Query::GenBank;
use Bio::Tools::Run::Alignment::Clustalw;
use Bio::AlignIO;

$stream = Bio::DB::GenBank->new->get_Stream_by_query(
  Bio::DB::Query::GenBank->new(-ids => \@ids)
);

@seqs = ();
while ($seq = $stream->next_seq) {
  push(@seqs, $seq);
}

$align = Bio::Tools::Run::Alignment::Clustalw->new->align(\@seqs);
Bio::AlignIO
  ->new(-file => ">$out.clustalw", -format => "clustalw")
  ->write_aln($align);

print("Alignment: $out.clustalw\n\n");
