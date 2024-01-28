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

> What will the last 2 lines output in this case?

`"STEVIE WONDER"`
`"STEVIE WONDER"`

Although setter methods return the argument/s passed upon invocation, the destructive method call `name.upcase!` affects the value of `@artist` because local variable `name` and instance variable `@name` both point to the same string object.