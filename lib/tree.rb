# frozen_string_literal: true

# Tree - A Balanced BST
class Tree # rubocop:disable Metrics/ClassLength
  require_relative 'node'
  attr_accessor :root

  def initialize(array)
    if array.is_a?(Array)
      @array = array.sort.uniq
    else
      puts 'Use an array'
    end
    @root = build_tree(@array)
    @traverse_out = []
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

  def delete(root, value) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    return root if root.nil?

    if root.data > value
      root.left = delete(root.left, value)
    elsif root.data < value
      root.right = delete(root.right, value)
    else
      return handle_single_child(root) if single_child?(root)

      successor = get_successor(root)
      root.data = successor.data
      root.right = delete(root.right, successor.data)
    end

    root
  end

  def find(root, value)
    # puts "looking for #{value} in #{root}:#{root.data}"
    return root if root.nil?

    if root.data < value
      # puts 'moving right'
      root = find(root.right, value)
    elsif root.data > value
      # puts 'moving left'
      root = find(root.left, value)
    end

    # puts "found: #{root.data}"
    root
  end

  def level_order(root, &block)
    return [] if root.nil?

    result = []
    queue = [root]

    until queue.empty?
      node = queue.shift
      block_given? ? block.call(node.data) : result << node.data
      enqueue_children(queue, node)
    end

    result
  end

  # inorder == left -> root -> right
  def inorder(root, result = [], &block)
    return [] if root.nil?

    inorder(root.left, result, &block)
    block_given? ? block.call(root.data) : result << root.data
    inorder(root.right, result, &block)

    result
  end

  # preorder == root -> left -> right
  def preorder(root, result = [], &block)
    return [] if root.nil?

    block_given? ? block.call(root.data) : result << root.data
    preorder(root.left, result, &block)
    preorder(root.right, result, &block)

    result
  end

  # postorder == left -> right -> root
  def postorder(root, result = [], &block)
    return [] if root.nil?

    postorder(root.left, result, &block)
    postorder(root.right, result, &block)
    block_given? ? block.call(root.data) : result << root.data
  end

  def height(node)
    # returns number of edges in longest path from self to a leaf
    return 0 if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)

    [left_height, right_height].max + 1
  end

  def depth(root, node)
    return -1 if root.nil?

    return 0 if root == node

    left_distance = depth(root.left, node)
    return left_distance + 1 if left_distance >= 0

    right_distance = depth(root.right, node)
    return right_distance + 1 if right_distance >= 0

    -1
  end

  def pretty_print(node = @root, prefix = '', is_left = true) # rubocop:disable Style/OptionalBooleanParameter
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  private

  def enqueue_children(queue, node)
    queue.push(node.left) unless node.left.nil?
    queue.push(node.right) unless node.right.nil?
  end

  def get_successor(current)
    current = current.right
    current = current.left while !current.nil? && !current.left.nil?
    current
  end

  def single_child?(node)
    node.left.nil? || node.right.nil?
  end

  def handle_single_child(node)
    node.left.nil? ? node.right : node.left
  end
end
