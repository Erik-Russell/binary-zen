# frozen_string_literal: true

require_relative 'lib/tree'

rand_arr = Array.new(10) { rand(1..100) }
# my_arr = [3, 5, 7, 9, 1, 2, 8, 6, 0]

tree = Tree.new(rand_arr)
# my_tree = Tree.new(my_arr)

# tree.pretty_print

# p tree.height(tree.root.left)
tree.insert(tree.root, 4)
tree.insert(tree.root, 35)
tree.insert(tree.root, 100)
tree.insert(tree.root, 102)
tree.insert(tree.root, 106)
tree.insert(tree.root, 108)
tree.delete(tree.root, 8)
tree.pretty_print

p tree.depth(tree.root, tree.root.right.right.right.right.right)
# puts tree.find(tree.root, 5)
# puts tree.find(tree.root, 2)
# puts tree.find(tree.root, 9)
# puts "108 is the @data of Node:#{tree.find(tree.root, 108)}"
# puts "level order: #{tree.level_order(tree.root).inspect}"
# level_order = []
# tree.level_order(tree.root) { |data| level_order << "Modulus 19 #{data % 19}" }
# p level_order

# puts "inorder: #{tree.inorder(tree.root).inspect}"
# inorder = []
# tree.inorder(tree.root) { |data| inorder << "mod 3 #{data % 3}" }
# p inorder

# puts "preorder: #{tree.preorder(tree.root).inspect}"
# preorder = []
# tree.preorder(tree.root) { |data| preorder << "mod 9 #{data % 9}" }
# p preorder

# puts "postorder: #{tree.postorder(tree.root).inspect}"
# postorder = []
# tree.postorder(tree.root) { |data| postorder << "mod 9 #{data % 9}" }
# p postorder
