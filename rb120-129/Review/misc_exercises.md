# RB129 Prep

Marwan's Exercises: <https://medium.com/@marwan.zaarab/rb129-interview-assessment-prep-e2f120330240>

Examples in my Gist: <https://gist.github.com/MrsBlooGhost/b6173754c093823d1d7f1cca04a01e90#file-rb120-129_-1-rb>

## My Solutions

#1

> What will the following code output? Why?

The code raises a SystemStackError indicating that a recursive error has occurred because on line 12, we are calling the setter method `id=()` within the setter method `id=()`.

We can fix this error by referencing the `@id` instance variable instead and initializing it to the `value` passed in. This way, the code outputs `45`.

```ruby
class Student
  attr_reader :id

  def initialize(name)
    @name = name
    @id
  end

  def id=(value)
    @id = value
  end
end

tom = Student.new("Tom")
tom.id = 45
tom.id # => 45
```

---

#2

> Define a class of your choice with the following:
> - Constructor method that initializes 2 instance variables.
> - Instance method that outputs an interpolated string of those > variables.
> - Getter methods for both (you can use the shorthand notation if you want).
> - Prevent instances from accessing these methods outside of the class.
> - Finally, explain what concept(s) you’ve just demonstrated with your code.

This code demonstrates encapsulation, which is the grouping of data into objects while making that data unavailable to the rest of the codebase. It is made unavailable via encapsulation of the state of each instance in instance variables. The state of the object can be retrieved by the instance method we have created. The behavior of each instance is further encapsulated through method access control. The getter methods are set as private, which prevents this data from being accessed in unwanted ways. 

```ruby
class School
  def initialize(name, location)
    @name = name
    @location = location
  end

  def give_info
    puts "This school is named #{@name} and is located in #{@location}."
  end

  private
  attr_reader :name, :location
end
```

---

#3

> What concept does the following code aim to demonstrate?

Polymorphism via interface inheritance is demonstrated in this code. 

Polymorphism is the ability of objects of different classes to respond to the same method invocation. This allows us to achieve a higher level of abstraction, while maintaining code that adheres to the DRY principle. 

Polymorphism can be achieve through interface inheritance, in which common behavior is extracted to a module, which is then mixed in to specific classes. As a result, the behavior defined in the module is made available to objects of those classes. 

---

#4

> What will the last line of code return?

A `NoMethodError` is raised, specifying that a private method `id` is called on `other`. This error is raised because private methods can only be called explicitly on `self`.

---

#5

> What will the last 2 lines of code output?

`Justice for all`\
`Justice for all!!!`

---

#6

> Will the following code execute? If so, what will be output? If not, can you fix it so it executes?

An `ArgumentError` is raised, specifying that on line 8, the `greet` method is given 1 argument and expects 0. This is due to the `super` method call on line 19, which passes all arguments along to the superclass's `greet` method. 

In order for the code to execute, we must call `super()` so that no arguments are passed along to the superclass's `greet` method. 

---

#7

> What concept does this code demonstrate? What will be the output?

`"Bird is flying!"`\
`"Pigeon is flying!"`\
`"Duck is flying!"`

This code demonstrates polymorphism through class inheritance.

Polymorphism is the ability of objects of different classes to respond to the same method invocation. All instances respond to the `fly` instance method.

Class inheritance is when a subclass inherits behaviors of a superclass. Both `Pigeon` and `Duck` inherit the `fly` method from the superclass `Bird`. 

---

#8

> What does the `self` keyword refer to in the `good` method?

`self` in the `good` method refers to the calling object.

---

#9

> What will the last three lines of code print to the console?

Line 16: `#<Song:0x00007f50f4738128 @title="Superstition">` - Calling `inspect` on an object outputs the class name (`Song`), an encoding of the object's ID, and any initialized instance variables along with their values (`@title="Superstitition"`).

Line 17: `"Stevie Wonder"` - Setter methods return the argument passed at method invocation.

Line 18: `"STEVIE WONDER"` - Getter method `artist` returns the value of `@artist`.

> After `song.artist` is called, what would be returned if we inspect the `song` object?

`#<Song:0x00007f50f4738128 @title="Superstition", @artist="STEVIE WONDER">` - At this point, `@artist` has been initialized. Therefore, what's output is the class name (`Song`), an encoding of the object's ID, and any initialized instance variables along with their values (`@title="Superstitition @artist="STEVIE WONDER"`).

---

#10

> What do the last two lines of code output?

`"STEVIE WONDER"`\
`"STEVIE WONDER"`

Although setter methods return the argument/s passed upon invocation, the destructive method call `name.upcase!` affects the value of `@artist` because local variable `name` and instance variable `@name` both point to the same string object.

---

#11

> What does `cat.name` on the last line return?

`nil` - On line 15, we call the getter method `name`, which returns the value of `@name`. `@name` is an uninitialized instance variable, and all uninitialized instance variables return `nil`.

> What is occurring on line 9?

Local variable initialization

> What two modifications to line 9 can be made so that `cat.name` returns `"Cheetos"`?

The following two modifications can be made so that `cat.name` returns `"Cheetos"`.

```ruby
class Cat
  attr_accessor :name

  def set_name
    @name = "Cheetos"
  end
end

cat = Cat.new
cat.set_name
cat.name
```

```ruby
class Cat
  attr_accessor :name

  def set_name
    self.name = "Cheetos"
  end
end

cat = Cat.new
cat.set_name
cat.name
```

---

#12

> What do the last two lines of code output?

`[Bugs, Bunny, Run, Walk, Jump, Object, Kernel, BasicObject]` - Calling the `Module#ancestors` method on a class returns an array of classes and modules in the lookup path.

`"Running"` - When Ruby resolves a constant, it first searches in the constant's lexical scope, then in the inheritance hierarchy, and lastly, in the main scope. Once Ruby finds the constant definition, it stops searching. In this case, Ruby doesn't find `STR` defined in the lexical scope, class `Bugs`. Ruby then looks up the inheritance hierarchy (`Bunny, Run, Walk, Jump, Object, Kernel, BasicObject`) and finds the constant `STR` initialized in module `Run`.

---

#13

> What is returned on the last two lines of code?

`"Local"`\
`"Global"`

This demonstrates how Ruby resolves a constant, first searching lexically for it.

> If we omit the first line (`VAL = ‘Global’`), what would the return values be?

`"Local"`\
`uninitialized constant Foo::Bar::VAL (NameError)`

> Without defining `VAL` again, show the two places you can add a line of code to the `Bar` class inside the `Foo` module to allow `value2` access to the same `VAL` as `value1`.

```ruby
module Foo
  VAL = 'Local'

  class Bar
    include Foo

    def value1
      VAL
    end
  end
end

class Foo::Bar
  def value2
    VAL
  end
end
```

```ruby
module Foo
  VAL = 'Local'

  class Bar
    def value1
      VAL
    end
  end
end

class Foo::Bar
  include Foo

  def value2
    VAL
  end
end
```

When we use the syntax `class Foo::Bar`, we are defining a new class `Bar` inside the `Foo` module. However, this doesn't automatically give the new `Bar` class access to the constants defined in the `Foo` module. In order to give the new `Bar` class access to the constants defined in the `Foo` module, we would have to `include` the module in the `Bar` class definition.

---

#14

> Write three methods in the `Person` class and one method in the `Friend` class that would return the outputs shown on the last two lines.

```ruby
class Person
  attr_reader :friends

  def initialize
    @friends = []
  end

  def <<(friend)
    @friends << friend
  end

  def []=(idx, friend)
    @friends[idx] = friend
  end

  def [](idx)
    @friends[idx]
  end
end

class Friend
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
end

tom = Person.new
john = Friend.new('John')
amber = Friend.new('Amber')

tom << amber
tom[1] = john
puts tom[0]      # => Amber
puts tom.friends # => Amber
                 # => John
```

---

#15

> What do the last two lines of code output?

`2`\
`2`

A class variable is shared among the superclass and all of its subclasses. Therefore, class variable re-assignment in a subclass affects the value of the class variable in the superclass and in all of its other subclasses.

---

#16

> Update the `Human` class so that lines 13 and 16 return the desired output.

```ruby
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
```

---

#17

> What does `self` refer to in the code snippet below?

`self` refers to different things depending on the context in which it is used. Within a class definition and outside an instance method, `self` refers to the class. Within a class definition and inside an instance method, `self` refers to the instance of the class.

On line 4, 6 and 7, `self` refers to the class `MeMyselfAndI`.

On line 11, `self` refers to the instance of the class `MeMyselfAndI` on which the method `myself` is being called on.

---

#18

> What are some characteristics of instance variables?

Instance variables and their values make up the attributes of an object.

Uninitialized instance variables reference `nil`.

Instance variables are scoped at the object level. Each object has its own copy of every instance variable defined in the class. They are accessible by instance methods defined in the class, and don't need to be passed as arguments prior to being referenced in the method. They can't be accessed outside of the class unless we have defined instance methods to interact with them.

---

#19

> Add 1 line of code in the `Person` class and 1 line of code in the `initalize` method to get the following output: `"My name is Roger and I am a Carpenter"`.

```ruby
# Problem by Natalie Thompson

class Person
  def initialize(name, job)
    @name = name
    @job = job
  end 

  def to_s
    "My name is #{@name} and I am a #{@job}."
  end
end

roger = Person.new("Roger", "Carpenter")
puts roger
```
I'm not sure how to add only ONE line in the `Person` class to get the output, so I just custom defined my own `to_s` method.

---

#20

> Modify the code below so that we get the expected outputs. 

```ruby
class Human  
  attr_reader :name 
  
  def initialize(name)
    @name = name
  end

  def equal?(other)
    name == other.name
  end

  def +(other)
    "anna" + other.name
  end
end

gilles = Human.new("gilles") 
anna = Human.new("gilles")

puts anna.equal?(gilles) # expected output: true
puts anna + gilles # expected output: annagilles 
```

I don't like this problem because it's not recommended to override `BasicObject#equal?`, but we have to do so in our solution. Therefore, I don't think this is a realistic problem. 

---

#21

> What does the code below output? Why?

`nil` is output because on line 48, `display` is called on `conan`, invoking the method on line 19, which invokes the getter method `name`, which returns the value of `@name`. `@name` was never initialized and therefore references `nil`.

---

#22

> Give class `Barbarian` the functionality of the instance method `attack` in `Monster` in three ways:

> By using class inheritance

```ruby
class Monster
  def attack
    "attacks from superclass!"
  end
end

class Barbarian < Monster
end

Barbarian.new.attack # => "attacks from superclass!"
```
> By using modules

```ruby
module Attackable
  def attack
    "attacks from module!"
  end
end

class Monster
  include Attackable
end

class Barbarian
  include Attackable
end

Barbarian.new.attack # => "attacks from module!"
```

> By using duck typing

```ruby
class Monster
  def attack
    "attacks from Monster!"
  end
end

class Barbarian
  def attack
    "attacks from Barbarian!"
  end
end

[Monster.new, Barbarian.new].each { |inst| puts inst.attack }
# Output:
# attacks from Monster!
# attacks from Barbarian!
```

---

#23

> Without adding any methods below, implement a solution so that the last two lines output `true`.

```ruby
class ClassA 
  attr_reader :field1, :field2
  
  def initialize(num)
    @field1 = "xyz"
    @field2 = num
  end
end

class ClassB 
  attr_reader :field1

  def initialize
    @field1 = "abc"
  end
end

obj1 = ClassA.new(50)
obj2 = ClassA.new(25)
obj3 = ClassB.new

p obj1.field2 > obj2.field2
p obj2.field1 > obj3.field1
```

---

#24

> Modify the code below so that we get the expected return values listed.

```ruby
class BenjaminButton 
  attr_accessor :actual_age, :appearance_age

  def initialize
    @actual_age = 0
    @appearance_age = 100
  end
  
  def get_older
    self.actual_age += 1
    self.appearance_age -= 1
  end
  
  def die
    self.actual_age = 100
    self.appearance_age = 0
  end
end

benjamin = BenjaminButton.new
p benjamin.actual_age # => 0
p benjamin.appearance_age # => 100

benjamin.get_older
p benjamin.actual_age # => 1
p benjamin.appearance_age # => 99

benjamin.die
p benjamin.actual_age # => 100
p benjamin.appearance_age # => 0
```

---

#25

> Add one line of code where indicated below so that we get the expected return values.

```ruby
class Wizard
  attr_reader :name, :hitpoints
  
  def initialize(name, hitpoints)
    @name = name
    @hitpoints = hitpoints
  end  
  
  def fireball
    "casts Fireball for 500 damage!"
  end
  
end

class Summoner < Wizard
  attr_reader :souls
  
  def initialize(name, hitpoints)
    super
    @souls = []
  end
  
  def soul_steal(character)
    @souls << character
  end
end

gandolf = Summoner.new("Gandolf", 100)
p gandolf.name # => "Gandolf"

valdimar = Wizard.new("Valdimar", 200)
p valdimar.fireball #=> "casts fireball for 500 damage!"

p gandolf.hitpoints #=> 100

p gandolf.soul_steal(valdimar) #=> [#<Wizard:0x000055d782470810 @name="Valdimar", @hitpoints=200>]

p gandolf.souls[0].fireball #=> "casts fireball for 500 damage!"
```

---

#26

> Modify the code below so that we get the expected return values listed. You can only add code to the `Flightable` module and the `Superhero` class in order to get the expected outputs.

```ruby
module Flightable
  def fly
    "I am #{name}, I am a #{self.class.to_s.downcase}, and I can fly!"
  end
end

class Superhero
  include Flightable

  attr_accessor :ability
  attr_reader :name
  
  def self.fight_crime
    puts "I am #{self}!"
    self.new.announce_ability
  end
  
  def initialize(name)
    @name = name
  end
  
  def announce_ability
    puts "I fight crime with my #{ability.description} ability!"
  end
end

class LSMan < Superhero
  def initialize
    @ability = Ability.new("coding skills")
  end
end

class Ability
  attr_reader :description

  def initialize(description)
    @description = description
  end
end

superman = Superhero.new('Superman')

puts superman.fly # => I am Superman, I am a superhero, and I can fly!
LSMan.fight_crime # => I am LSMan!
                  # => I fight crime with my coding skills ability!
```