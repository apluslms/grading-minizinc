#!/bin/sh

echo " -------- Building test image -------------"
docker build -t apluslms/grading-minizinc:test .

echo " ------ Printing MiniZinc version ---------"
if docker run --rm -it --entrypoint /usr/local/bin/minizinc -v "$(pwd)":/submission -w /submission apluslms/grading-minizinc:test --version; then
    echo " -- OK!"
else
    echo " !!! ERROR !!! "
    exit 1
fi
echo " ------ Executing test instance -----------"
if docker run --rm -it --entrypoint /usr/local/bin/minizinc -v "$(pwd)":/submission -w /submission apluslms/grading-minizinc:test --solver org.gecode.gecode test.mzn; then
    echo " -- OK!"
else
    echo " !!! ERROR !!! "
    exit 1
fi
