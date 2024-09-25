# frozen_string_literal: true

require_relative 'lib/tree'

rand_arr = Array.new(15) { rand(1..100) }
my_arr = [3, 5, 7, 9, 1, 2, 8, 6, 0]

tree = Tree.new(my_arr)

tree.pretty_print

tree.insert(tree.root, 4)
tree.insert(tree.root, 35)
tree.insert(tree.root, 100)
tree.insert(tree.root, 102)
tree.insert(tree.root, 106)
tree.insert(tree.root, 108)
tree.delete(tree.root, 8)
tree.pretty_print
