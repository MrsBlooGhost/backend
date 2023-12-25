# We define our `Pet` class. We need an `initialize` method that sets the pet's 
# type and name, and corresponding getter methods so we can retrieve these names. 

# We also provide a `to_s` method override so we can convert `Pet` objects into 
# meaningful strings; this will be useful from `Owner#print_pets`.

class Pet
  attr_reader :animal, :name

  def initialize(animal, name)
    @animal = animal
    @name = name
  end

  def to_s
		"a #{animal} named #{name}"
	end
end

# We define the `Owner` class, which only needs to support 2 methods: `initialize`
# and `number_of_pets`. Since `number_of_pets` is an `Owner` instance 
# method, we will also store a list of each owner's adopted pets 
# in the `Owner` object. So, we initialize `@pets`, add a getter method for `@pets`,
# and a method `add_pet` to add a newly adopted pet to the owner record. Finally, 
# we also need a `print_pets` method so we can print the list of the owner's 
# pets.

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def number_of_pets
    pets.size
  end

  def print_pets
    puts pets
  end
end

# The `Shelter` class needs `initialize`, `adopt` and `print_adoptions` methods to 
# match the example code. The `adopt` method adds a new pet to the owner record, 
# and then adds the owner record to our `@owners` instance hash, but only if the
# owner is not already listed. (We assume here that there are no owners with 
# matching names, and that we will never create multiple `Owner` objects for the
# same owner.) Finally, `print_adoptions` iterates through our owner list, 
# printing their name and a list of the pets the owner has adopted.

class Shelter
  def initialize
		@owners = {}
  end

  def adopt(owner, pet)
    owner.add_pet(pet)
    @owners[owner.name] ||= owner
  end

  def print_adoptions
		@owners.each_pair do |name, owner|
      puts "#{name} has adopted the following pets:"
      owner.print_pets
      puts
    end
  end

This exercise is about collaborator objects; instance variables don't have to be 
simple variables like numbers and strings, but can contain any object that might
be needed. In our solution, the `Pet` class has two String collaborator objects,
`Owner` has a String and an Array of `Pet` objects, and `Shelter` has a Hash of
`Owner` objects.

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def number_of_pets
    pets.size
  end

  def print_pets
    puts pets
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

# shelter = Shelter.new
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions

puts "#{phanson.name}" #has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name}" #has #{bholmes.number_of_pets} adopted pets."