require './node'

class LinkedList
  def initialize(value)
    @head = Node.new(value, nil)
  end

  def add_to_end(value)
    current_node = @head
    while current_node.next != nil
      current_node = current_node.next
    end
    current_node.next = Node.new(value, nil)
  end

  def add_to_top(value)
    current_node = @head
    current_node.next = current_node
    current_node.value = value
  end

  def delete(value)
    current_node = @head
    if current_node.value == value
      @head = current_node.next
    else
      while (current_node.next != nil) && (current_node.next.value != value)
        current_node = current_node.next
      end
      unless current_node.next == nil
        current_node.next = current_node.next.next
      end
    end
  end

  def delete_from_top
    current_node = @head
    @head = current_node.next
  end

  def return_list
    elements = []
    current_node = @head
    while current_node.next != nil
      elements << current_node
      current_node = current_node.next
    end
    elements << current_node
  end
end
