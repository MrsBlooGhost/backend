class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
	end
end

p AngryCat.new(4, "George")
p AngryCat.new(5, "Kat")