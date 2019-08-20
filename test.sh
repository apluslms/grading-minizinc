#!/bin/sh

echo " -------- Building test image -------------"
docker build -t apluslms/grading-minizinc:test .

echo " -------- Executing test image ------------"
if docker run --rm -it -v `pwd`:/submission apluslms/grading-minizinc:test minizinc --solver org.gecode.gecode test.mzn; then
    echo " -- OK!"
else
    echo " !!! ERROR !!! "
fi
