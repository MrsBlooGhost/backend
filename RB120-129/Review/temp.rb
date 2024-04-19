# 16 — Update the `Human` class so that lines 13 and 16 return the desired output.

# Problem taken from tinyurl.com/mr42tf4t, creator: Raul Romero

class Human 
  attr_reader :name

  def initialize(name="Dylan")
    @name = name
  end

  def hair_color(color)
    "Hi, my name is #{name} and I have #{color} hair."
  end

  def self.hair_color(color)
    color = "blonde" if color.empty?
    "Hi, my name is #{self.new.name} and I have #{color} hair."
  end
end

puts Human.new("Jo").hair_color("blonde")  
# Should output "Hi, my name is Jo and I have blonde hair."

puts Human.hair_color("")              
# Should output "Hi, my name is Dylan and I have blonde hair."