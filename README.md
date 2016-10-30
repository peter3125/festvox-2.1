# festvox-2.1
Festival arctic voices in a Ubuntu 12.04 machine (using festival 2.1 compatibility)

The Dockerfile here is used to automatically build the image peter3125/festvox-2.1 as a basis for an image.

It is based on Ubuntu 12.04 LTS and contains the following software:

Festival 2.1


To use this Docker image, you need to have a working version of Docker; on Linux and Mac OS you will also need a way to run a Linux kernel in a virtual machine. Visit docs.docker.com and follow the "Get Started" instructions for your platform.

Then download the 

Minimally you want to be able to run the official Ubuntu image, like this:

docker run --rm -it ubuntu:xenial /bin/bash
Once that is working you can try out synthesizing with the "cmu_us_slt_arctic-0.95-release.tar.bz2" from http://festvox.org/cmu_arctic/cmu_arctic/packed/  This voice will be set as the default voice.  You can modify the Dockerfile and change all references to "cmu_us_slt_arctic" with one of the other voices to change the voice.


echo Hello world | docker run --rm -i festival /usr/bin/text2wave | aplay

or to create a RIFF wave file

echo Hello world | docker run --rm -i festival /usr/bin/text2wave > hello.wav
