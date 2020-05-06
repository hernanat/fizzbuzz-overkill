require "benchmark"
require "./fizzbuzz_classic"
require "./fizzbuzz_generalized"

num_times = 1000
n = 2500

puts "benchmarking classic and general algorithms with:"
puts "iterations = #{num_times}"
puts "n = #{n}\n\n"

puts "benchmark classic algorithms"

include FizzbuzzClassic

Benchmark.bmbm do |benchmark|
  benchmark.report "#fizz_buzz_classic" do
    num_times.times do
      fizz_buzz_classic(n)
    end
  end

  benchmark.report "#fizz_buzz_classic_hash" do
    num_times.times do
      fizz_buzz_classic_hash(n)
    end
  end

  benchmark.report "#fizz_buzz_classic_hash2" do
    num_times.times do
      fizz_buzz_classic_hash2(n)
    end
  end

  benchmark.report "#fizz_buzz_classic_merge" do
    num_times.times do
      fizz_buzz_classic_merge(n)
    end
  end
end

puts "\n\nbenchmark general algorithms"

include FizzbuzzGeneralized

h = { 3 => "Fizz", 5 => "Buzz", 7 => "Baz", 11 => "Bizz", 13 => "Bopz" }
Benchmark.bmbm do |benchmark|
  benchmark.report "#fizz_buzz_general: 2 FizzBuzz numbers" do
    num_times.times do
      fizz_buzz_general(n, h.slice(3, 5))
    end
  end

  benchmark.report "#fizz_buzz_general: 3 FizzBuzz numbers" do
    num_times.times do
      fizz_buzz_general(n, h.slice(3, 5, 7))
    end
  end

  benchmark.report "#fizz_buzz_general: 4 FizzBuzz numbers" do
    num_times.times do
      fizz_buzz_general(n, h.slice(3, 5, 7, 11))
    end
  end

  benchmark.report "#fizz_buzz_general: 5 FizzBuzz numbers" do
    num_times.times do
      fizz_buzz_general(n, h)
    end
  end

  benchmark.report "#fizz_buzz_general_prime: 2 FizzBuzz numbers" do
    num_times.times do
      fizz_buzz_general_prime(n, h.slice(3, 5))
    end
  end

  benchmark.report "#fizz_buzz_general_prime: 3 FizzBuzz numbers" do
    num_times.times do
      fizz_buzz_general_prime(n, h.slice(3, 5, 7))
    end
  end

  benchmark.report "#fizz_buzz_general_prime: 4 FizzBuzz numbers" do
    num_times.times do
      fizz_buzz_general_prime(n, h.slice(3, 5, 7, 11))
    end
  end

  benchmark.report "#fizz_buzz_general_prime: 5 FizzBuzz numbers" do
    num_times.times do
      fizz_buzz_general_prime(n, h)
    end
  end

  benchmark.report "#fizz_buzz_general_prime_divisors: 2 FizzBuzz numbers" do
    num_times.times do
      fizz_buzz_general_prime_divisors(n, h.slice(3, 5))
    end
  end

  benchmark.report "#fizz_buzz_general_prime_divisors: 3 FizzBuzz numbers" do
    num_times.times do
      fizz_buzz_general_prime_divisors(n, h.slice(3, 5, 7))
    end
  end

  benchmark.report "#fizz_buzz_general_prime_divisors: 4 FizzBuzz numbers" do
    num_times.times do
      fizz_buzz_general_prime_divisors(n, h.slice(3, 5, 7, 11))
    end
  end

  benchmark.report "#fizz_buzz_general_prime_divisors: 5 FizzBuzz numbers" do
    num_times.times do
      fizz_buzz_general_prime_divisors(n, h)
    end
  end
end


