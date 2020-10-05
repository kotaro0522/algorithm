require './linked_list'

class Stack
  def initialize(value)
    @list = LinkedList.new(value)
  end

  def push(value)
    @list.add_to_top(value)
  end

  def pop
    @list.delete_from_top
  end

  def list
    @list
  end

end
