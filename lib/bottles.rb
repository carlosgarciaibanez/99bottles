#!/usr/bin/env ruby

class Bottles 

  def song
    return verses(99, 0)
  end

  def verses(from, to)
    return from.downto(to).map{ |verse_num| verse(verse_num) }.join("\n")
  end

  def verse(verse_num)
    "#{quantity(verse_num).capitalize} #{container(verse_num)} of beer on the wall, #{quantity(verse_num)} #{container(verse_num)} of beer.\n" +
      "#{action(verse_num)}, #{quantity(successor(verse_num))} #{container(successor(verse_num))} of beer on the wall.\n" 
  end 

  def successor(num)
    BottleNumber.new(num).successor
  end

  def action(num)
    BottleNumber.new(num).action
  end

  def container(num) 
     BottleNumber.new(num).container
  end 

  def pronoun(number)
    BottleNumber.new(number).pronoun
  end

  def quantity(rawNumber)
    BottleNumber.new(rawNumber).quantity
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
  end
end

if __FILE__ == $0
  puts Bottles.new.song	
end
