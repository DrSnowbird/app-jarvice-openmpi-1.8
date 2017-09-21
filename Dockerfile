
FROM jarvice/base-centos-torque:6.0.4

RUN yum -y install nano vim emacs man csh atlas ack && \
    yum clean all

COPY 01-openmpi-path.sh /etc/profile.d/01-openmpi-path.sh
COPY AppDef.json /etc/NAE/AppDef.json
COPY gms-files.csh /tmp/gms-files.csh

RUN mkdir /scratch && \
    sudo ln -s /bin/bash /usr/bin/bash && \
    #### ---- fix openmpi's include folder is located at different location
    sudo ln -s /usr/include/openmpi-x86_64 /usr/lib64/openmpi/include && \
    ## ----- blast ----
    sudo ln -s /usr/lib64/atlas/libatlas.so.3.0 /usr/lib64/atlas/libatlas.so && \
    sudo ln -s /usr/lib64/atlas/libclapack.so.3.0 /usr/lib64/atlas/libclapack.so && \
    sudo ln -s /usr/lib64/atlas/liblapack.so.3.0 /usr/lib64/atlas/liblapack.so && \
    sudo ln -s /usr/lib64/atlas/libptf77blas.so.3.0 /usr/lib64/atlas/libptf77blas.so && \
    sudo ln -s /usr/lib64/atlas/libcblas.so.3.0 /usr/lib64/atlas/libcblas.so && \
    sudo ln -s /usr/lib64/atlas/libf77blas.so.3.0 /usr/lib64/atlas/libf77blas.so && \
    sudo ln -s /usr/lib64/atlas/libptcblas.so.3.0 /usr/lib64/atlas/libptcblas.so

    
