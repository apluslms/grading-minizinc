Grading environment based on [grading-base](https://hub.docker.com/r/apluslms/grading-base/)
with specific version of [MiniZinc](http://www.minizinc.org/).

Tags
----

Images are tagged with MiniZinc and grading-base versions in format `<minizinc>-<grading-base>`.
Version tag can also include `uN` meaning _update N_ where N is an increasing number.
The update part is used to indicate updates to the image, where software versions did not change.
For an example, `2.1.7-2.0u1` includes MiniZinc 2.1.7 on top of grading-base 2.0 and has one update after first release.
