require './node'

class Main
  root = Node.new(6)
  root.left = Node.new(2)
  root.left.left = Node.new(1)
  root.left.right = Node.new(4)
  root.left.right.left = Node.new(3)
  root.left.right.right = Node.new(5)
  root.right = Node.new(7)
  root.right.right = Node.new(9)
  root.right.right.left = Node.new(8)

  def self.level_order(root)
    ans = []
    queue = [root]
    until queue.empty?
      node = queue.shift
      ans.push(node.data)
      !node.left.nil? && queue.push(node.left)
      !node.right.nil? && queue.push(node.right)
    end

    ans
  end

  p level_order(root)
end
