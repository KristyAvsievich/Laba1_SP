FROM centos

RUN yum install bash -y && yum install git -y

WORKDIR /home/downloads/

RUN git clone https://github.com/KristyAvsievich/Laba1_SP.git && cd Laba1_SP && chmod ugo+x Ystanovshik_Paketov.sh
