# Dockerfile to build Swiss flavor of minimal Debian Wheezy

FROM debian:stretch
MAINTAINER rezzonic

RUN echo "deb http://mirror.switch.ch/ftp/mirror/debian/ stretch main contrib non-free" > /etc/apt/sources.list
RUN echo "deb http://mirror.switch.ch/ftp/mirror/debian/ stretch-updates main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb http://ftp.ch.debian.org/debian/ stretch main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb http://ftp.ch.debian.org/debian/ stretch-updates main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb http://security.debian.org stretch/updates main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get -y install git python g++ gfortran environment-modules curl make
RUN git clone https://github.com/llnl/spack.git 
RUN echo 'module() { eval `/usr/bin/modulecmd sh $*`; }' >> /spack/share/spack/setup-env.sh

RUN sh /spack/share/spack/setup-env.sh

RUN echo 'module() { eval `/usr/bin/modulecmd $modules_shell $*`; }' >> /root/.bashrc

ENV SPACK_ROOT=/spack

