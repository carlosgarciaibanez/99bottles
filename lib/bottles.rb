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
      when 1
	return "1 bottle of beer on the wall, 1 bottle of beer.\n" +
		"Take it down and pass it around, no more bottles of beer on the wall.\n"
      when 2
        return "2 bottles of beer on the wall, 2 bottles of beer.\n" +
		"Take one down and pass it around, 1 bottle of beer on the wall.\n"
      else
        return "#{verse_num} bottles of beer on the wall, #{verse_num} bottles of beer.\n" +
		"Take one down and pass it around, #{verse_num - 1} bottles of beer on the wall.\n"
     end
  end 
end

if __FILE__ == $0
  puts Bottles.new.song	
end
