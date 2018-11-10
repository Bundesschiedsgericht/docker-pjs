FROM ubuntu:16.04
MAINTAINER Stefan Thoeni <stefan.thoeni@piratengericht.ch>

RUN echo "A1"
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/ubuntu stable-xenial main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt-get update && apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mono-complete wget vim git gnupg2 davfs2

RUN echo "U9g"
RUN git clone https://github.com/Bundesschiedsgericht/PirateJusticeStatus
RUN cd /PirateJusticeStatus && msbuild PirateJusticeStatus.sln
COPY entry.sh /entry.sh

ENTRYPOINT ["/entry.sh"]
