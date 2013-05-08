# The following iterative sequence is defined for the set of positive integers:

# n ->n/2 (n is even) n ->3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:

# 13 40 20 10 5 16 8 4 2 1 It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# optimize this and send it to ed
# the collatz of 26 is 11. collatz of 13 is 10. 26/2 = 13. just add 1 to the collatz size of 13. 
# store collatz sequences, check if there's a sequence we already know.
# ex. if we know collatz of 13, we also know the collatzs for 40, 20, 10, 5, 16, 8, 4, 2, and 1. 

class Collatz

  def initialize(number)
    @number = number
    @counter = 1
  end

  def next_step
    if @number.even?
      evenprocess
    else
      oddprocess
    end
  end

  def oddprocess
    3*@number + 1
  end

  def evenprocess
    @number/2  
  end

  def run
    while @number > 1
      answer = self.next_step
      @number = answer
      @counter += 1
    end
  end

  def length
    @counter
  end

end

starttime = Time.now

# puts mycollatz = Collatz.new(13)
# puts mycollatz.run
# puts mycollatz.length

myhash = {}

(1..100000).each do |num|
  collatz = Collatz.new(num)
  collatz.run
  size = collatz.length
  myhash[num] = size
  puts "For number #{num} the length is #{size}."
end

puts myhash.sort_by {|key, value| value}.inspect

endtime = Time.now
how_fast = endtime - starttime
puts how_fast
