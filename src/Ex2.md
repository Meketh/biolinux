# Interpretacion del reporte blast

## 1. Datos del programa
    BLASTP 2.9.0+

    Reference: Stephen F. Altschul, Thomas L. Madden, Alejandro A.
    Schaffer, Jinghui Zhang, Zheng Zhang, Webb Miller, and David J.
    Lipman (1997), "Gapped BLAST and PSI-BLAST: a new generation of
    protein database search programs", Nucleic Acids Res. 25:3389-3402.

    Reference for composition-based statistics: Alejandro A. Schaffer,
    L. Aravind, Thomas L. Madden, Sergei Shavirin, John L. Spouge, Yuri
    I. Wolf, Eugene V. Koonin, and Stephen F. Altschul (2001),
    "Improving the accuracy of PSI-BLAST protein database searches with
    composition-based statistics and other refinements", Nucleic Acids
    Res. 29:2994-3005.

## 2. Base de datos
    Database: swissprot
           474,714 sequences; 179,658,219 total letters

## 3. Query
    Query= NM_032409 Homo sapiens PTEN induced kinase 1 (PINK1), mRNA; nuclear
    gene for mitochondrial product.

## 4. Listado de secuencias
Es un listado de las secuencias que alinearon significativamente con el mRNA.
En la lista figuran el accession, extracto de la descripcion, el bit score y el e value.

                                                                          Score        E
    Sequences producing significant alignments:                          (Bits)     Value

    Q9BXM7.1 RecName: Full=Serine/threonine-protein kinase PINK1, mit...  1172       0.0
    B5DFG1.1 RecName: Full=Serine/threonine-protein kinase PINK1, mit...  952        0.0
    Q99MQ3.2 RecName: Full=Serine/threonine-protein kinase PINK1, mit...  945        0.0
    Q09298.2 RecName: Full=Serine/threonine-protein kinase pink-1, mi...  214        3e-60
    P24719.1 RecName: Full=Meiosis-specific serine/threonine-protein ...  71.2       8e-12

## 5. Detalle de secuencias
Por cada secuencia el accession, la descripcion, el detalle del bit score con el metodo utilizado y luego el alineamiento entre la consulta y la proteína de la db.

    >Q8INB9.3 RecName: Full=RAC serine/threonine-protein kinase; Short=DAkt;
    Short=DRAC-PK; Short=Dakt1; AltName: Full=Akt; AltName:
    Full=Protein kinase B; Short=PKB [Drosophila melanogaster]
    Length=611

    Score = 53.1 bits (126),  Expect = 4e-06, Method: Compositional matrix adjust.
    Identities = 45/154 (29%), Positives = 69/154 (45%), Gaps = 20/154 (13%)

    Query  345  QLLEGVDHLVQQGIAHRDLKSDNILVELDPDGCPWLVIADFGCCLADESIGLQLPFSSWY  404
                +++  + +L  QGI +RDLK +N+L  LD DG   + +ADFG C  D + G
    Sbjct  372  EIISALGYLHSQGIIYRDLKLENLL--LDKDGH--IKVADFGLCKEDITYGRTTKTFC--  425

    Query  405  VDRGGNGCLMAPEVSTARPGPRAVIDYSKA-DAWAVGAIAYEIFGLVNPFYGQGKAHLES  463
                    G    +APEV           DY +A D W  G + YE+     PFY +    L +
    Sbjct  426  ----GTPEYLAPEVLDDN-------DYGQAVDWWGTGVVMYEMICGRLPFYNRDHDVLFT  474

    Query  464  RSYQEAQLPALPESVPPDVRQLVRALLQREASKR  497
                    E      P ++  + + L+  LL ++  KR
    Sbjct  475  LILVEE--VKFPRNITDEAKNLLAGLLAKDPKKR  506

El bit score deriva de un puntaje de alineamiento que se asigna a la hora de hacer la comparación, la diferencia con este bit score es que considera datos estadísticos por lo que es un score normalizado que se puede usar para comparar resultados con otras búsquedas.

Luego esta el E-value que representa la expectativa de encontrar un valor mejor o igual en una búsqueda en una base de datos. A menor E value, más alto el score.

## 6. Detalle de la query
Al final se encuentran datos generales de la forma en la que se realizó la query.

Los parámetros utilizados:

    Lambda      K        H        a         alpha
      0.321    0.137    0.424    0.792     4.96

    Gapped
    Lambda      K        H        a         alpha    sigma
      0.267   0.0410    0.140     1.90     42.6     43.6

- **Lambda** dato estadístico para la conversión del score al bit score relacionado con el sistema de scoring.
- **K** dato estadístico para la conversión del score al bit score relacionado con el espacio de búsqueda.
- **H** entropía relativa entre los residuos de aminoácidos de las secuencias. Es el promedio de información que provee cada posición del alineamiento.

Datos del uso de la db:

    Effective search space used: 55540925826


      Database: swissprot
        Posted date:  Nov 26, 2020  6:38 PM
      Number of letters in database: 179,658,219
      Number of sequences in database:  474,714

Y la matriz utilizada:

    Matrix: BLOSUM62
    Gap Penalties: Existence: 11, Extension: 1
    Neighboring words threshold: 11
    Window for multiple hits: 40
