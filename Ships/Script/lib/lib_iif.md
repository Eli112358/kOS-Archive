## lib_iif

This library declares one function that implements the [trinary operator](https://en.wikipedia.org/wiki/%3F:), aka inline if: iif.

### iif

args:

- condition - a boolean condition or value; eg: foo = 5
- trueValue - returned if condition is true; eg: "foo is 5"
- falseValue - returned if condition is false; eg: "foo is not 5"

description:

- 

example: `iff(foo = 5,"foo is 5","foo is not 5").`
