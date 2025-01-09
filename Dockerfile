FROM ubuntu:16.04

# Set environment variables
ENV LANG=en_US.UTF-8

# Install necessary tools and dependencies
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
        alien \
        ksh \
        locales \
        build-essential \
        g++-4.8-multilib \
        g++-4.8 \
        libice6 \
        libice6:i386 \
        libsm6 \
        libsm6:i386 \
        libx11-6 \
        libx11-6:i386 \
        libx11-dev:i386 \
        libc6-i386 \
        lib32stdc++6 \
        lib32gcc1 \
        lib32z1 \
        libgmp-dev \
        lib32ncurses5 \
        vim \
        libncurses5-dev \
        wget \
    && rm -rf /var/lib/apt/lists/* \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen

# Update alternatives to set g++-4.8 as default
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 100 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 100 && \
    update-alternatives --set gcc /usr/bin/gcc-4.8 && \
    update-alternatives --set g++ /usr/bin/g++-4.8

WORKDIR /usr/src/app
COPY STk-4.0.1-ucb1.3.6.i386.rpm ./

# Convert RPM to DEB and install
RUN alien --target=amd64 STk-4.0.1-ucb1.3.6.i386.rpm && \
    dpkg -i --force-architecture stk_4.0.1-1_amd64.deb && \
    rm -f STk-4.0.1-ucb1.3.6.i386.rpm  stk_4.0.1-1_amd64.deb


# To run UCB extension, run `stk -load load-simply`
# Default command to open a bash shell
CMD ["/bin/bash"]
