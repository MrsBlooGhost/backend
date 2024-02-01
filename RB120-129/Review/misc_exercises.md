# RB129 Prep

Marwan's Exercises: <https://medium.com/@marwan.zaarab/rb129-interview-assessment-prep-e2f120330240>

Examples in my Gist: <https://gist.github.com/MrsBlooGhost/b6173754c093823d1d7f1cca04a01e90#file-rb120-129_-1-rb>

## My Solutions

1 -

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

---

#3


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

Instance variables store the values of the attributes of an individual object, enabling each object to have a unique state.

Instance variables are scoped at the object level. This means they are accessible by any instance method defined in that class and they don't need to be passed in as arguments prior to being referenced to in the method.

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

`nil` is output because on line 48, `display` is called on `conan`, invoking the method on line, which invokes the getter method `name`, which returns the value of `@name`. `@name` was never initialized and therefore references `nil`.

---

#22

# From Joseph Ochoa

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