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
    if num == 0
      99
    else
      num - 1
    end
  end

  def action(num)
    if num == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(num)} down and pass it around"
    end
  end

  def container(num) 
     if (num == 1)
        "bottle"
     else 
        "bottles"
     end
  end 

  def pronoun(number)
    if (number == 1)
      "it"
    else
      "one"
    end
  end

  def quantity(rawNumber)
    if (rawNumber == 0) 
      "no more"
    else
      rawNumber.to_s
    end
  end
end

if __FILE__ == $0
  puts Bottles.new.song	
end
