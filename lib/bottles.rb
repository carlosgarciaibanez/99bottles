#!/usr/bin/env ruby

class Bottles 

  def song
    return verses(99, 0)
  end

  def verses(from, to)
    return from.downto(to).map{ |verse_num| verse(verse_num) }.join("\n")
  end

  def verse(verse_num)
    bottle_number = BottleNumber.new(verse_num)
    next_bottle_number = BottleNumber.new(bottle_number.successor)
    "#{bottle_number} of beer on the wall, #{bottle_number} of beer.\n".capitalize +
    "#{bottle_number.action}, #{next_bottle_number} of beer on the wall.\n" 
  end 

  class BottleNumber

    attr_reader :number

    def initialize(number) 
      @number = number
    end

    def successor
      if number == 0
        99
      else
        number - 1
      end
    end
  
    def action
      if number == 0
        "Go to the store and buy some more"
      else
        "Take #{pronoun} down and pass it around"
      end
    end
  
    def container
       if (number == 1)
          "bottle"
       else 
          "bottles"
       end
    end 

    def pronoun
      if (number == 1)
        "it"
      else
        "one"
      end
    end
  
    def quantity
      if (number == 0) 
        "no more"
      else
        number.to_s
      end
    end

    def to_s
      "#{quantity} #{container}"
    end
  end
end

if __FILE__ == $0
  puts Bottles.new.song	
end
