# frozen_string_literal: true

# Node - Stores data of each node and what it's children are
class Node
  include Comparable
  attr_accessor :data, :left, :right

  def initialize(data, left_child = nil, right_child = nil)
    @data = data
    @left = left_child
    @right = right_child
  end

  def <=>(other)
    data <=> other.data
  end
end
