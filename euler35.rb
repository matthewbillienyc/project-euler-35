
class CircularPrimeCheck

  attr_reader :range, :circular_primes

  def initialize(range)
    @range = range
    @circular_primes = []
  end

  def is_prime?(num)
    max = Math.sqrt(num)
    (2..max).any? {|i| 
      if num % i == 0
        return false
      end
    }
    true
  end

  def extract_perumations(num)
    ((num.to_s.chars.map(&:to_i)).permutation.to_a).map {|arr| arr.join()}.map(&:to_i)
  end

  def is_circular_prime?(permutations)
    permutations.map{|n|
      is_prime?(n)
    }
  end

  def check_range
    range.each {|n|
      if !is_circular_prime?(extract_perumations(n)).include?(false)
        circular_primes << n
      end
    }
  end

end

checker = CircularPrimeCheck.new((0..1000000))
checker.check_range
puts checker.circular_primes



