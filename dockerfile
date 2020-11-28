FROM ubuntu

ENV TZ=America/Argentina/Buenos_Aires
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
  && echo $TZ > /etc/timezone

RUN apt-get update -y \
  && apt-get upgrade -y \
  && apt-get install -y \
    wget build-essential \
    cpanminus bioperl \
    emboss ncbi-* \
  && mkdir db app

WORKDIR /db

RUN wget -q ftp://ftp.ncbi.nlm.nih.gov/blast/db/FASTA/swissprot.gz \
  && gunzip swissprot.gz \
  && makeblastdb -dbtype prot -in swissprot \
  && rm -rf swissprot swissprot.gz

RUN prositeftp=ftp://ftp.expasy.org/databases/prosite \
  && wget -q $prositeftp/prosite.dat \
  && wget -q $prositeftp/prosite.doc \
  && prosextract -prositedir /db

RUN cpanm Bio::Perl Bio::DB::EUtilities
RUN cpanm -f Bio::Factory::EMBOSS Bio::Tools::Run::StandAloneBlastPlus

# LATEST blast+
# RUN blasturl=ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+ \
#   && blastver=$(wget -qO - $blasturl/VERSION) \
#   && blast=ncbi-blast-$blastver+ \
#   && wget -q $blasturl/$blastver/$blast-x64-linux.tar.gz \
#   && gunzip $blast-x64-linux.tar.gz \
#   && tar xvf $blast-x64-linux.tar \
#   && mv $blast/bin/* /bin \
#   && rm -rf $blast*

WORKDIR /app
