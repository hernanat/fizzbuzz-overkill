require "prime"

module FizzbuzzGeneralized
  # these methods assume the keys of the `factors` hashes are sorted.
  # I wanted to avoid adding additional sort overhead.
  # If you pass in unsorted keys, it will still work, but the words will be
  # out of order
  #
  # there's overhead from constructing the relevant structures everytime
  # the methods are called. If we extracted this out into a class
  # where the additional structures are computed up initialization,
  # then subsequent calls to the methods would be faster (the classes
  # would be FizzBuzz generators for the factors hash and would have
  # a method that just takes in an integer `n`
  
  # this assumes all the factors are prime
  def fizz_buzz_general_prime(n, factors = { 3 => "Fizz", 5 => "Buzz" })
    modulus = factors.keys.reduce(&:*)
    exponent = factors.keys.map(&method(:totient)).reduce(1, :lcm)
    assigner = assignment_hash_for(factors, exponent, modulus)
    Array.new(n) do |i|
      num = i + 1
      assigner[num.pow(exponent, modulus)].call(num)
    end
  end

  # this assumes all the factors are prime
  def fizz_buzz_general_prime_divisors(n, factors = { 3 => "Fizz", 5 => "Buzz" })
    Array.new(n) do |i|
      num = i + 1
      # `prime_division` fails spectacularly for large
      # numbers because factoring is hard

      primes = num.prime_division.map(&:first)
      if primes.any? { |p| factors.has_key?(p) }
        num.prime_division.map(&:first).reduce("") do |str, factor|
          "#{str}#{factors[factor]}"
        end
      else
        num
      end
    end
  end

  def fizz_buzz_general(n, factors = { 3 => "Fizz", 5 => "Buzz" })
    mapping = factors.to_a
    2.upto(factors.size) do |num_combos|
      mapping.concat(
        factors.keys.combination(num_combos).
        map { |combo| [combo.reduce(&:*), factors.values_at(*combo).join ]}
      )
    end
    mapping.reverse!
    Array.new(n) do |i|
      num = i + 1
      mapping.find { |(divisor, _)| num % divisor == 0}.then { |_, w| w.nil? ? num : w }
    end
  end

  private

  def modulus_and_exponent(n_array)
    [
      n_array.reduce(&:*),
      n_array.map(&method(:totient)).reduce(1, :lcm)
    ]
  end

  def totient(a)
    a.prime_division.reduce(1) { |phi, (p, e)| phi * (p - 1) * p.pow(e - 1) }
  end

  def assignment_hash_for(factors, exponent, modulus)
    modulus, exponent = modulus_and_exponent(factors.keys)
    factors.reduce({ 1 => ->(x) { x } }) do |result, (factor, word)|
      result[factor.pow(exponent, modulus)] = ->(_) { word }
      result
    end.then { |result| add_combination_assignments(factors, exponent, modulus, result) }
  end

  def add_combination_assignments(factors, exponent, modulus, assignment_hash)
    2.upto(factors.size) do |num_combos|
      factors.keys.combination(num_combos).each do |combo|
        assignment_hash[combo.reduce(&:*).pow(exponent, modulus)] = ->(_) do
          factors.values_at(*combo).reduce(&:+)
        end
      end
    end
    assignment_hash
  end
end
