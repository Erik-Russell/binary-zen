# frozen_string_literal: true

require_relative 'lib/tree'

my_arr = Array.new(15) { rand(1..100) }

tree = Tree.new(my_arr)

tree.pretty_print
