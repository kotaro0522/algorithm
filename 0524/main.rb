require './stack'
require './linked_list'
#
# hoge = Stack.new(123)
#
# hoge.push(333)
# hoge.push(444)
#
# p hoge.list
#
# hoge.pop
#
# p hoge.list

fuga = LinkedList.new(123)

fuga.add_to_top(555)

# fuga.add_to_top(8989)

p fuga.return_list

# fuga.delete_from_top
#
# p fuga.return_list

