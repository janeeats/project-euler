# the collatz of 26 is 11. collatz of 13 is 10. 26/2 = 13. just add 1 to 10, which is the collatz of 13.
# store collatz sequences, check if there's a sequence we already know.
# ex. if we know collatz of 13, we also know the collatzs for 40, 20, 10, 5, 16, 8, 4, 2, and 1. 

class Collatz
  attr_accessor :start, :current, :length, :table

  def initialize(start)
    @start = start
    @current = start
    @length = 1
  end

  def next_step
    if @current.even?
      evenprocess
    else
      oddprocess
    end
  end

  def oddprocess
    3*@current + 1
  end

  def evenprocess
    @current/2  
  end

  def run
    while @current > 1
      if @@collatzes.has_key?(@current)
        @length += @@collatzes[@current] - 1
        break
      else
        answer = next_step
        @length += 1
        @current = answer
      end
    end
  end

end

class Table
  attr_accessor :collatzes

  def initialize(collatzes)
    self.collatzes = collatzes
  end

  def add_collatz(start, length)
    collatzes[start] = length
  end

end

# require "benchmark"
 
# time = Benchmark.realtime do
#   (1..10000).each { |i| i }
# end
# puts "Time elapsed #{time} seconds."

@@collatzes = {}

(1..100).each do |num|
  collatz = Collatz.new(num)
  collatz.run
  size = collatz.length
  @@collatzes[num] = size
  puts "Starting number #{num} returns collatz of #{size}."
end

puts @@collatzes.sort_by {|key, value| value}.inspect

