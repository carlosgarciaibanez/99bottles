#!/usr/bin/env ruby

class Bottles 

  def song
    return verses(99, 0)
  end

  def verses(from, to)
    return from.downto(to).map{ |verse_num| verse(verse_num) }.join("\n")
  end

  def verse(verse_num)
    return first_part(verse_num) + second_part(verse_num)
  end 

  private def first_part(bottles)
    return "#{how_many(bottles)} on the wall, #{how_many(bottles)}.\n".capitalize
  end

  private def second_part(bottles)
    if bottles == 0
      what_to_do = "Go to the store and buy some more"
      next_bottles = 99
    else
      what_to_do = "Take #{bottles > 1? "one": "it"} down and pass it around"
      next_bottles = bottles - 1
    end
    return "#{what_to_do}, #{how_many(next_bottles)} on the wall.\n"
  end

  private def how_many(bottles)
    how_many = if bottles > 0 
      "#{bottles} bottle#{"s" if bottles > 1}"
    else
      "no more bottles"
    end
    return "#{how_many} of beer"  
  end
end

if __FILE__ == $0
  puts Bottles.new.song	
end
