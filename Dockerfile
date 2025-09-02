FROM apluslms/grade-python:3.13-4.13-4.10

ARG VERSION=2.9.3
ARG NAME=MiniZincIDE-$VERSION-bundle-linux-x86_64

RUN apt_install \
    libqt6printsupport6 \
    libgl1-mesa-dev \
 && :


RUN cd /tmp \
    && curl -LOSs https://github.com/MiniZinc/MiniZincIDE/releases/download/$VERSION/$NAME.tgz \
    && tar -xzf $NAME.tgz \
    && (cd $NAME \
     && cp bin/minizinc* bin/fzn-* bin/findMUS bin/mzn2doc /usr/local/bin \
     && cp -r share/minizinc /usr/local/share/ \
     && cp -r lib /usr/local/lib/minizinc \
    ) \
    && rm -rf $NAME.tgz $NAME

ENV MZN_STDLIB_DIR=/usr/local/share/minizinc/
