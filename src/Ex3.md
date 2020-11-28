# Interpretacion del MSA

Para realizar el alineamiento multiple utilizamos el algoritmo "CLUSTAL W (1.81) multiple sequence alignment".
Como podemos ver en el siguiente estracto del alineamiento se usa una linea para cada proteina y una al final para marcar el resultado.

    KCC2A_DROME/1-530      ICRKLHHPNIVRLHDSIQEE.NYHYLVFDLVTGGELFEDIVAREFYSEADASHCIQQILE
    CAMKI_MACNP/1-345      VLRRLQHPNIVQLMETYEDR.EHVYLIIELVTGGELFDRIVEKGSYTEKDASDLIRQVLE
    NP_115785/1-581        LAARLQRQFVVRAWGCAGPCGRAVFLAFGLGLG..LIEEKQAES.RRAVSACQEIQAIFT
    PINK1_MOUSE/1-580      LAARIQRQFMVRARGGAGPCGRAVFLAFGLGLG..LIEEKQAEG.RRAASACQEIQAIFT
    CDPK1_PLAYO/1-535      LLKSLDHPNIIKLFDVFEDK.KYFYLVTEFYEGGELFEQIINRHKFDECDAANIMKQILS
    KRAC_DICDI/1-444       ILQKINHPFLVNLNYSFQTE.DKLYFILDYVNGGELFYHLQKDKKFTEDRVRYYGAEIVL
    ULK3_XENLA/1-468       ILKTVHHPHILELKDFQWDQ.DYIFLITEYCAGGDLSRFIRTRRILPERIVQVFLQQLAS
                           :   :.:  ::.            ::      *  *              .      :

En la linea de resultado podemos ver 4 valores posibles que coincidan "*", que no coincidan " ", que tengan sustitución conservada (caracteristicas similares) ":" o una semi conservada (froma similar) ".". Osea entre menos espacio en blanco mas parecidas son.

Ahora es interesante ver como pese a ser varias proteinas distintas ciertas posiciones se conservan, esto podria dar evidencia de alguna funcion importante que intenta conservarse.
