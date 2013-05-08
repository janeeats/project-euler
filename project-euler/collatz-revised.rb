# the collatz of 26 is 11. collatz of 13 is 10. 26/2 = 13. just add 1 to 10, which is the collatz of 13.
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
      if @@collatzes.has_key?(@number)
        @counter += @@collatzes[@number] - 1
        break
      else
        answer = next_step
        @counter += 1
        @number = answer
      end
    end
  end

  def length
    @counter
  end

end

starttime = Time.now

@@collatzes = {}

(1..100).each do |num|
  collatz = Collatz.new(num)
  collatz.run
  size = collatz.length
  @@collatzes[num] = size
  puts "Starting number #{num} returns collatz of #{size}."
end

puts @@collatzes.sort_by {|key, value| value}.inspect

endtime = Time.now
how_fast = endtime - starttime
puts how_fast