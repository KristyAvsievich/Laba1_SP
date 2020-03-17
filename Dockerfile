FROM centos

RUN yum install bash && yum install git

WORKDIR /home/downloads/

RUN git clone https://github.com/KristyAvsievich/Laba1_SP.git && cd Laba1_SP && chmod ugo+x Ustanovshik_Paketov.sh
