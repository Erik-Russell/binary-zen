# frozen_string_literal: true

# Tree - A Balanced BST
class Tree
  require_relative 'node'
  attr_accessor :root

  def initialize(array)
    if array.is_a?(Array)
      @array = array.sort.uniq
    else
      puts 'Use an array'
    end
    @root = build_tree(@array)
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

  def insert(root, value)
    if root.nil?
      return Node.new(value)
    elsif root.data == value
      root
    elsif root.data < value
      root.right = insert(root.right, value)
    else
      root.left = insert(root.left, value)
    end

    root
  end

  def get_successor(current)
    current = current.right
    current = current.left while !current.nil? && !current.left.nil?
    current
  end

  def delete(root, value)
    return root if root.nil?

    if root.data > value
      root.left = delete(root.left, value)
    elsif root.data < value
      root.right = delete(root.right, value)
    else
      return root.right if root.left.nil?
      return root.left if root.right.nil?

      succ = get_successor(root)
      root.data = succ.data
      root.right = delete(root.right, succ.data)
    end

    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true) # rubocop:disable Style/OptionalBooleanParameter
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
