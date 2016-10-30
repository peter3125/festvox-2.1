FROM ubuntu:12.04

MAINTAINER Peter de Vocht <peter@peter.co.nz>

ENV LANG=C.UTF-8
# default voice to use (three letter combo see README.txt)
ENV VOICE slt

RUN apt-get update && apt-get install -y --no-install-recommends \
		autoconf festival festlex-cmu festlex-poslex libestools1.2 unzip bzip2 \
                festvox-kallpc16k festvox-kdlpc16k \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# create voices directory
RUN mkdir -p /usr/share/festival/voices/english/
WORKDIR /usr/share/festival/voices/english/
# copy voice from local to docker image
COPY cmu_us_${VOICE}_arctic-0.95-release.tar.bz2 .
# extract file inside docker image
RUN tar jxf cmu_us_${VOICE}_arctic-0.95-release.tar.bz2
# remove archive file after unzipping
RUN rm -f cmu_us_${VOICE}_arctic-0.95-release.tar.bz2
# rename directory for Festival
RUN mv cmu_us_${VOICE}_arctic cmu_us_${VOICE}_arctic_clunits
# set default voice for the entire image
RUN echo "(set! voice_default 'voice_cmu_us_${VOICE}_arctic_clunits)" >> /etc/festival.scm

WORKDIR /
# show usage
RUN echo "echo Hello world | sudo docker run --rm -i festival /usr/bin/text2wave > hello.wav"

CMD ["/bin/bash"]
