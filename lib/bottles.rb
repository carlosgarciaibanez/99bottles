#!/usr/bin/env ruby

class Bottles 

  def song
    return verses(99, 0)
  end

  def verses(from, to)
    return from.downto(to).map{ |verse_num| verse(verse_num) }.join("\n")
  end

  def verse(verse_num)
    bottle_number = bottle_number_for(verse_num)
    next_bottle_number = bottle_number_for(bottle_number.successor)
    "#{bottle_number} of beer on the wall, #{bottle_number} of beer.\n".capitalize +
    "#{bottle_number.action}, #{next_bottle_number} of beer on the wall.\n" 
  end 

  def bottle_number_for(number)
    case number
      when 0
        BottleNumber0
      when 1
        BottleNumber1
      else
        BottleNumber
    end.new(number)
  end

  class BottleNumber

    attr_reader :number

    def initialize(number) 
      @number = number
    end

    def successor
      number - 1
    end
  
    def action
      "Take #{pronoun} down and pass it around"
    end
  
    def container
      "bottles"
    end 

    def pronoun
      "one"
    end
  
    def quantity
      number.to_s
    end

    def to_s
      "#{quantity} #{container}"
    end
  end

  class BottleNumber0 < BottleNumber
    def action
      "Go to the store and buy some more"
    end

    def successor
      99
    end

    def quantity
      "no more"
    end
  end

  class BottleNumber1 < BottleNumber
    def container
      "bottle"
    end

    def pronoun
      "it"
    end
  end
end

if __FILE__ == $0
  puts Bottles.new.song	
end
