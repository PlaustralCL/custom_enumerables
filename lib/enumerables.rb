# frozen_string_literal: true

# Add custom methods to replicate some of the functionality of the built in
# Enumerable module
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
    for index in 0..(length - 1)
      return true if block.call(self[index])
    end
    false
  end

  def my_none?(&block)
    block = ->(obj) { obj } unless block_given?
    for index in 0..(length - 1)
      return false if block.call(self[index])
    end
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
    index = 0
    while index < size
      mapped_array.push(block.call(to_a[index]))
      index += 1
    end
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

end


if $PROGRAM_NAME == __FILE__
  numbers = [44, 66, 9, 12]
  numbers.my_each { |item| puts item }
  puts ""
  numbers.each { |item| puts item }
  puts ""

  p numbers.my_each
  p numbers.each
end
