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

2 -

---

3 -

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