#!/usr/bin/env ruby

class Bottles 

  def song
    return verses(99, 0)
  end

  def verses(from, to)
    return from.downto(to).map{ |verse_num| verse(verse_num) }.join("\n")
  end

  def verse(verse_num)
    case verse_num
      when 0
	return """No more bottles of beer on the wall, no more bottles of beer.\n" +
		"Go to the store and buy some more, 99 bottles of beer on the wall.\n""" 
      else
        return "#{verse_num} #{container(verse_num)} of beer on the wall, #{verse_num} #{container(verse_num)} of beer.\n" +
		"Take #{pronoun(verse_num)} down and pass it around, #{quantity(verse_num - 1)} #{container(verse_num - 1)} of beer on the wall.\n"
     end
  end 

  def container(num) 
     if (num == 1)
        return "bottle"
     else 
        return "bottles"
     end
  end 

  def pronoun(number)
    if (number == 1)
      return "it"
    else
      return "one"
    end
  end

  def quantity(rawNumber)
    if (rawNumber == 0) 
      return "no more"
    else
      return rawNumber.to_s
    end
  end
end

if __FILE__ == $0
  puts Bottles.new.song	
end
