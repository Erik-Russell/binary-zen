# frozen_string_literal: true

# Tree - A Balanced BST
class Tree
  require_relative 'node'

  def initialize(array)
    if array.is_a?(Array)
      @array = array.sort.uniq
    else
      puts 'Use an array'
    end
    @root = build_tree(@array)
    puts 'bst created successfully!'
  end

  def build_tree(array)
    return nil unless array.is_a?(Array)

    return nil if array.empty?

    mid = array.length / 2
    root = Node.new(array[mid])
    root.left = build_tree(array[0...mid])
    root.right = build_tree(array[mid + 1..])

    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true) # rubocop:disable Style/OptionalBooleanParameter
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
