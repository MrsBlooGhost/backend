# This class represents a todo item and its associated data: name and description. There's also a "done" flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_reader :title

  def initialize(title)
    @title = title
    @tasks = []
  end

  def add(todo)
    raise TypeError, "Can only add Todo objects" unless todo.instance_of?(Todo)
    
    @tasks << todo
  end

  alias_method :<<, :add

  def size
    @tasks.size
  end

  def first
    @tasks.first
  end

  def last
    @tasks.last
  end

  def to_a
    @tasks.clone
  end

  def done?
    @tasks.all?(&:done?)
  end

  def item_at(idx)
    @tasks.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    @tasks.each(&:done!)
  end

  def shift
    @tasks.shift
  end

  def pop
    @tasks.pop
  end

  def remove_at(idx)
    @tasks.delete(item_at(idx))
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @tasks.map(&:to_s).join("\n")
  end

  def each
    @tasks.each { |task| yield(task) }
    self
  end

  def select
    result = TodoList.new(title)
    each { |task| result.add(task) if yield(task) }
    result
  end

  def find_by_title(name)
    select { |task| task.title == name }.first
  end

  def all_done
    select { |task| task.done? }
  end

  def all_not_done
    select { |task| !task.done? }
  end

  def mark_done(name)
    each { |task| find_by_title(name).done! }
  end

  def mark_all_done
    done!
  end

  def mark_all_undone
    each(&:undone!)
  end
end