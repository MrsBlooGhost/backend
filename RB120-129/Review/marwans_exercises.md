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

9 -

> What will the last three lines of code print to the console?

Line 16: `inspect` is called on an instance of the `Song` class, which outputs the class `Song`, an encoding of the object ID, and the initialized instance variable `@title` along with its value `Superstitition`.

Line 17: Setter methods return the argument passed in, so `"Stevie Wonder"` is output.

Line 18: Getter method `artist` returns the value of `@artist`, which references `"STEVIE WONDER"`.

**After `song.artist` is called, what would be returned if we inspect the `song` object?**

The `Song` class, an encoding of the object ID, and initialized instance variables with their values: `<Song:(encoding of obj ID) @title="Superstition" @name="STEVIE WONDER">`

---

10 -

