FROM ubuntu:16.04

# Set environment variables
ENV LANG=en_US.UTF-8

# Install necessary tools and dependencies
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
        ksh \
        locales \
        build-essential \
        g++-4.8-multilib \
        g++-4.8 \
        libsm6:i386 \
        libx11-6:i386 \
        libx11-dev:i386 \
        libc6-i386 \
        lib32stdc++6 \
        lib32gcc1 \
        lib32z1 \
        libgmp-dev \
        lib32ncurses5 \
        vim \
    && rm -rf /var/lib/apt/lists/* \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen

# Update alternatives to set g++-4.8 as default
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 100 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 100 && \
    update-alternatives --set gcc /usr/bin/gcc-4.8 && \
    update-alternatives --set g++ /usr/bin/g++-4.8

# Set up build directory and copy source
WORKDIR /usr/src/app
COPY stk-1.3.6.tgz ./
RUN tar -xf stk-1.3.6.tgz && \
    rm stk-1.3.6.tgz

# Fix the Tcl configure by setting system explicitly
WORKDIR /usr/src/app/stk/Tcl
RUN  sed -i "s/system=MP-RAS-\`awk '{print \$3}' \/etc\/.relid'\`/system=Linux/" configure

# Change STk.init settings (step 9)
WORKDIR /usr/src/app/stk
RUN sed -i 's|/usr/local/lib/slib/|/usr/local/lib/stk/slib/|' Lib/STk.init && \
    sed -i 's|/3.99.3/|/usr/local/lib/stk/1.3.6/|' Lib/STk.init

# Modify gcc references in configure (step 10)
RUN sed -i 's|ac_cv_prog_ac_ct_CC="gcc"|ac_cv_prog_ac_ct_CC="gcc -m32"|' configure && \
    sed -i 's|if test "$CC" = "gcc" -a "$SH_CCFLAGS" != "" ; then|if test "$CC" = "gcc -m32" -a "$SH_CCFLAGS" != "" ; then|' configure


# Configure and prepare for build
RUN find . -type f -name configure -exec chmod +x {} \;
RUN ./configure --prefix=/usr/local

# Modify Makefile to use -m32 (step 12)
RUN sed -i 's|^CC.*=.*gcc$|& -m32|' configure

RUN make  && make install

CMD ["/bin/bash"]
