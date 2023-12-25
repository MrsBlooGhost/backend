class Pet
  def gait
    "gallop"
  end
end

class Person
  def action(person)
    gait
  end
end

horsy = Pet.new
puts horsy.gait

x = Person.new
puts x.action