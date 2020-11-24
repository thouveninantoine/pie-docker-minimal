FROM archlinux

RUN pacman -Sy --noconfirm --needed base-devel gcc make cmake wget git

RUN git clone https://github.com/Snaipe/libcsptr.git && \
    cd libcsptr && \
    mkdir build && cd $_ && cmake -DCMAKE_INSTALL_PREFIX=/usr .. && make && make install
RUN wget https://github.com/Snaipe/Criterion/releases/download/v2.3.3/criterion-v2.3.3-linux-x86_64.tar.bz2 && \
    wget https://github.com/Snaipe/Criterion/releases/download/v2.3.3/criterion-v2.3.3.tar.bz2 && \
    tar -xvf criterion-v2.3.3-linux-x86_64.tar.bz2 && \
    tar -xvf criterion-v2.3.3.tar.bz2 && \
    cd criterion-v2.3.3 && \
    mkdir build && \
    cd build && \
    cmake .. && \
    cmake --build . && \
    make install


CMD [ "/bin/bash" ]
