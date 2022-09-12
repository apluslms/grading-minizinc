FROM apluslms/grade-python:3.9-4.6-4.5

ARG VERSION=2.6.4
ARG NAME=MiniZincIDE-$VERSION-bundle-linux-x86_64

RUN apt_install \
    libqt5printsupport5 \
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
