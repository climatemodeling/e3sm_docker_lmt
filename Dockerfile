FROM gcc:8

WORKDIR /home/lmtuser

#ENTRYPOINT ["/bin/bash"]



#soft env prepare

RUN apt-get -y update

RUN apt-get -y install apt-utils
RUN cp /usr/local/bin/gfortran /usr/bin/
RUN apt-get -y install openmpi*
RUN apt-get -y remove gfortran
RUN apt -y autoremove


RUN apt-get -y install libnetcdf13 libnetcdff6 libnetcdf-pnetcdf-13 libhdf5-103 libhdf5-openmpi-103
RUN ln -sf /usr/lib/x86_64-linux-gnu/libnetcdf* /usr/lib/
RUN ln -sf /usr/lib/x86_64-linux-gnu/libhdf5_* /usr/lib/

RUN apt-get -y install subversion perl libxml-libxml-perl
RUN apt-get -y install libxml2-utils environment-modules
RUN apt-get -y install liblapack3 liblapack-dev

RUN ln -sf /usr/bin/make /usr/bin/gmake
RUN ln -sf /usr/lib/x86_64-linux-gnu/ /usr/lib64

#pnetcdf

RUN git clone https://github.com/Parallel-NetCDF/PnetCDF.git

RUN cd PnetCDF && autoreconf -i && ./configure --prefix=/usr/local/PnetCDF && make -j8 && make install
#
# directory setting


#e3sm
RUN mkdir -p /root/.ssh
RUN chmod 700 /root/.ssh
COPY id_rsa  /root/.ssh/
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

RUN chmod 600 /root/.ssh/id_rsa
RUN cd /home/lmtuser
RUN git clone https://github.com/minxu74/E3SM.git

RUN cd E3SM && git submodule update --init
#
RUN export USER=lmtuser

RUN mkdir /scratch/E3SM_inputdata -p
RUN mkdir /scratch/lmtuser -p








