FROM apluslms/grade-python:3.7-3.2.3-3.0

RUN apt-get update -qqy && DEBIAN_FRONTEND=noninteractive apt-get install -qqy --no-install-recommends \
    -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
    build-essential \
    python3 \
&& rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN apt-get update -qqy && DEBIAN_FRONTEND=noninteractive apt-get install -qqy --no-install-recommends \
    -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
    libqt5core5a \
    libqt5gui5 \
    libqt5widgets5 \
    libqt5printsupport5 \
    libicu63 \
    libmpfr6 \
&& rm -rf /var/lib/apt/lists/* /var/cache/apt/*

ARG VERSION=2.3.1
ARG NAME=MiniZincIDE-$VERSION-bundle-linux

RUN cd /tmp \
    && curl -LOSs https://github.com/MiniZinc/MiniZincIDE/releases/download/$VERSION/$NAME-x86_64.tgz \
    && tar -xzf $NAME-x86_64.tgz \
    && (cd $NAME \
     && cp bin/minizinc* bin/fzn-* bin/findMUS bin/mzn2doc /usr/local/bin \
     && cp -r share/minizinc /usr/local/share/ \
     && cp -r lib /usr/local/lib/minizinc \
    ) \
    && rm -rf $NAME-x86_64.tgz $NAME

ENV MZN_STDLIB_DIR=/usr/local/share/minizinc/
