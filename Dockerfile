FROM jupyter/scipy-notebook
MAINTAINER Shiva Kaul <skkaul@cs.cmu.edu>
RUN apt-get update && apt-get install -y libtool build-essential autoconf
RUN pip install cython --upgrade
RUN git clone https://github.com/cert-ace/cuckoovec.git
RUN cd cuckoovec/libcuckoo && autoreconf -fis && ./configure && make && make install
RUN cd cuckoovec && ls && python setup.py install