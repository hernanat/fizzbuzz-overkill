module FizzbuzzClassic
  FIZZ = "Fizz".freeze
  BUZZ = "Buzz".freeze
  FIZZBUZZ = "#{FIZZ}#{BUZZ}".freeze

  def fizz_buzz_classic(n)
    Array.new(n) { |i| fizz_buzz_classic_helper(i + 1) }
  end

  def fizz_buzz_classic_hash(n)
    h = { 1 => ->(x) { x }, 6 => ->(_) { FIZZ }, 10 => ->(_) { BUZZ }, 0 => ->(_) { FIZZBUZZ } }

    Array.new(n) do |i|
      num = i + 1
      h[num.pow(4, 15)].call(num)
    end
  end

  def fizz_buzz_classic_hash2(n)
    Array.new(n) do |i|
      ->(n){ [[[FIZZ][n % 3],[BUZZ][n % 5]].join].find(->{ n }){ |str| !str.empty? } }.call(i + 1)
    end
  end

  # why this? because I can
  def fizz_buzz_classic_merge(n)
    pivot = n / 2
    fizz_buzz_merge_helper(1, pivot).
      concat(fizz_buzz_merge_helper(pivot + 1, n))
  end

  private

  def fizz_buzz_merge_helper(min, max)
    diff = max - min
    case diff
    when 0
      [max]
    when 1
      [fizz_buzz_classic_helper(min), fizz_buzz_classic_helper(max)]
    else
      pivot = min + diff / 2
      fizz_buzz_merge_helper(min, pivot).
        concat(fizz_buzz_merge_helper(pivot + 1, max))
    end
  end

  def fizz_buzz_classic_helper(x)
    if x % 15 == 0
      FIZZBUZZ
    elsif x % 5 == 0
      BUZZ
    elsif x % 3 == 0
      FIZZ
    else
      x
    end
  end
end
