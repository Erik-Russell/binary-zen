# frozen_string_literal: true

require_relative 'lib/tree'

test_arr = Array.new(15) { rand(1..100) }

test = Tree.new(test_arr)

test.pretty_print

puts "Tree is balanced: #{test.balanced?(test.root)}"

puts "Level sort: #{test.level_order(test.root)}"

puts "Pre-order sort: #{test.preorder(test.root)}"

puts "Post-order sort: #{test.postorder(test.root)}"

puts "In-order sort: #{test.inorder(test.root)}"

puts '***Adding large numbers to unbalance***'
test.insert(test.root, rand(100..200))
test.insert(test.root, rand(100..200))
test.insert(test.root, rand(100..200))
test.insert(test.root, rand(100..200))
test.insert(test.root, rand(100..200))
test.insert(test.root, rand(100..200))

puts "Tree is balanced: #{test.balanced?(test.root)}"

test.rebalance

puts "Tree is balanced: #{test.balanced?(test.root)}"

puts "Level sort: #{test.level_order(test.root)}"

puts "Pre-order sort: #{test.preorder(test.root)}"

puts "Post-order sort: #{test.postorder(test.root)}"

puts "In-order sort: #{test.inorder(test.root)}"

test.pretty_print
