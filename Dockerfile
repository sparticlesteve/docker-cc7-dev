FROM sfarrell/cc7-basic
MAINTAINER Steve Farrell <Steven.Farrell@cern.ch>

# Basic update
RUN yum update -y

# Install gcc prereqs
RUN yum install -y bzip2 libmpc-devel mpfr-devel gmp-devel flex

# Get and build gcc 4.9.3
RUN mkdir /gcc493 && cd /gcc493 && mkdir gcc493_build && \
    wget http://mirrors.kernel.org/gnu/gcc/gcc-4.9.3/gcc-4.9.3.tar.gz && \
    tar xzf gcc-4.9.3.tar.gz && cd gcc493_build && \
    ../gcc-4.9.3/configure --disable-multilib \
                           --enable-languages=c,c++,fortran \
                           --enable-threads=posix && \
    make -j4 && make install && \
    rm -rf /gcc493

# LD library configuration
RUN echo /usr/local/lib64 > /etc/ld.so.conf.d/local.conf && \
    echo /usr/local/lib >> /etc/ld.so.conf.d/local.conf && \
    ldconfig && ldconfig -p
