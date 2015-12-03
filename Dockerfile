FROM jupyter/scipy-notebook
MAINTAINER Shiva Kaul <skkaul@cs.cmu.edu>
RUN apt-get update && apt-get install -y libtool build-essential autoconf curl
RUN pip install cython --upgrade
RUN curl -kL https://github.com/cert-ace/cuckoovec/archive/master.tar.gz | tar xz 
RUN cd cuckoovec-master/libcuckoo && autoreconf -fis && ./configure && make && make install
RUN cd cuckoovec-master && ls && python setup.py install