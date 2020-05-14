# FizzBuzz Overkill

## What is this?

This is a repo to hold all the ideas that I have / have come across for solving the
  FizzBuzz problem.

## Why?

One reason is that it's a common enough problem that gets asked that I thought it would be
  interesting to try to come up with different ways to solve it -- even if they're impractical.

The main reason has to do with an [article](http://philcrissman.net/posts/eulers-fizzbuzz/) that was  written and I [subsequently responded to](https://blog.antfeedr.com/posts/fizzbuzz.html).

There are some interesting mathematics associated with the FizzBuzz problem, and I started this
  repo when I was exploring them.

## Benchmark outputs

### Quick note

The benchmarks can be somewhat misleading (aside from the usual issues surrounding benchmarking code). There is some obvious overhead associated with some
  of the algorithm implementations (building the intermediate structures to help map to the
  proper output).

In reality, these solutions would probably live in a class that builds
  the required intermediate structures on initialization, and then subsequent method calls
  would take advantage of them.

Since I am lazy, I haven't gotten around to doing that yet. I offer the current benchmark
  results that I have gotten nonetheless:

```
benchmarking classic and general algorithms with:
iterations = 1000
n = 2500

                               user     system      total        real
#fizz_buzz_classic         0.288311   0.002350   0.290661 (  0.290723)
#fizz_buzz_classic_hash    0.444072   0.000776   0.444848 (  0.444978)
#fizz_buzz_classic_hash2   5.254826   0.002382   5.257208 (  5.258910)
#fizz_buzz_classic_merge   0.430810   0.000276   0.431086 (  0.431179)


benchmark general algorithms
                                                            user     system      total        real
#fizz_buzz_general: 2 FizzBuzz numbers                  1.370272   0.000357   1.370629 (  1.370938)
#fizz_buzz_general: 3 FizzBuzz numbers                  2.069991   0.001037   2.071028 (  2.071703)
#fizz_buzz_general: 4 FizzBuzz numbers                  3.562739   0.000961   3.563700 (  3.564157)
#fizz_buzz_general: 5 FizzBuzz numbers                  6.578838   0.002110   6.580948 (  6.582343)
#fizz_buzz_general_prime: 2 FizzBuzz numbers            0.539663   0.000222   0.539885 (  0.540043)
#fizz_buzz_general_prime: 3 FizzBuzz numbers            0.663335   0.000142   0.663477 (  0.663587)
#fizz_buzz_general_prime: 4 FizzBuzz numbers            0.781672   0.000226   0.781898 (  0.782090)
#fizz_buzz_general_prime: 5 FizzBuzz numbers            0.868601   0.000130   0.868731 (  0.868801)
#fizz_buzz_general_prime_divisors: 2 FizzBuzz numbers  12.399420   0.004063  12.403483 ( 12.405226)
#fizz_buzz_general_prime_divisors: 3 FizzBuzz numbers  13.010551   0.004115  13.014666 ( 13.016497)
#fizz_buzz_general_prime_divisors: 4 FizzBuzz numbers  13.365264   0.004266  13.369530 ( 13.372180)
#fizz_buzz_general_prime_divisors: 5 FizzBuzz numbers  13.998646   0.004592  14.003238 ( 14.005112)
```
