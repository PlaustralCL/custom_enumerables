# frozen_string_literal: true

# Add custom methods to replicate some of the functionality of the built in
# Enumerable module. The goal of this exercise to not use the built in `each`
# function the cop for using Style/For has been disabled.
module Enumerable
  # rubocop:disable Style/For
  def my_each
    return to_enum unless block_given?

    index = 0
    while index < length
      yield self[index]
      index += 1
    end
    self
  end

  def my_each_with_index
    return to_enum unless block_given?

    for index in 0..(length - 1)
      yield(self[index], index)
    end
  end

  def my_select
    return to_enum unless block_given?

    result = []
    for index in 0..(length - 1)
      result.push(self[index]) if yield(self[index])
    end
    result
  end

  def my_all?(&block)
    block = ->(obj) { obj } unless block_given?
    for index in 0..(length - 1)
      return false unless block.call(self[index])
    end
    true
  end

  def my_any?(&block)
    block = ->(obj) { obj } unless block_given?
    my_each { |item| return true if block.call(item) }
    false
  end

  def my_none?(&block)
    block = ->(obj) { obj } unless block_given?
    my_each { |item| return false if block.call(item) }
    true
  end

  def my_count(item = true, &block)
    counter = 0
    block = ->(_obj) { item } unless block_given?
    for index in 0..(length - 1)
      counter += 1 if block.call(self[index])
    end
    counter
  end

  # Works with blocks
  def my_map(&block)
    return to_enum unless block_given?

    mapped_array = []
    # index = 0
    # while index < size
    #   mapped_array.push(block.call(to_a[index]))
    #   index += 1
    # end
    mapped_array
  end

  # works with procs
  def my_map_proc(my_proc)
    mapped_array = []
    index = 0
    while index < size
      mapped_array.push(my_proc.call(to_a[index]))
      index += 1
    end
    mapped_array
  end

  # Works with procs and blocks. If both given, uses only the proc
  def my_map_proc_block(my_proc = nil, &my_block)
    my_block = my_proc || my_block

    mapped_array = []
    index = 0
    while index < size
      mapped_array.push(my_block.call(to_a[index]))
      index += 1
    end
    mapped_array
  end

  def my_inject(init = nil)
    memo =  init || to_a.first
    index = 0
    while index < size
      memo = yield(memo, to_a[index]) if ( index > 0 || init)
      index += 1
    end
    memo
  end

  # uses my_each
  def my_select2
    return to_enum unless block_given?

    result = []
    my_each { |num| result.push(num) if yield(num) }
    result
  end

  def my_all2?(&block)
    block = ->(obj) { obj } unless block_given?
    my_each { |item| return false unless block.call(item) }
    true
  end

  def my_map2(&block)
    return to_enum unless block_given?

    mapped_array = []
    to_a.my_each { |item| mapped_array.push(block.call(item)) }
    mapped_array
  end
end
