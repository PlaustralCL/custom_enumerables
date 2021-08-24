# frozen_string_literal: true

require_relative "./enumerables"

numbers = [44, 66, 9, 12]
animals = %w[ant bear cat]

puts "my_each vs each, with a block"
numbers.my_each { |item| print "#{item} " }
puts ""
numbers.each { |item| print "#{item} " }
puts "\n\n"

puts "my_each vs each, no block"
puts numbers.my_each
puts numbers.each
puts ""

puts "my_each_with_index vs each_with_index"
puts "index --> item"
numbers.my_each_with_index { |item, index| puts "#{index} --> #{item}" }
puts ""
numbers.each_with_index { |item, index| puts "#{index} --> #{item}" }
puts ""

puts "my_each_with_index vs each_with_index, no block"
puts numbers.my_each_with_index
puts numbers.each_with_index
puts ""

puts "my_select vs select"
puts numbers.my_select { |num| num.even? }.to_s
puts numbers.select { |num| num.even? }.to_s
puts ""

puts "my_all? vs all?"
puts "works with block when all true. expect: #{animals.all? { |word| word.length >= 3 }}; " \
     "actual: #{animals.my_all? { |word| word.length >= 3 }}"
puts "works with block when not all true. expect: #{animals.all? { |word| word.length >= 4 }}; " \
     "actual: #{animals.my_all? { |word| word.length >= 4 }}"
puts "works with no block when not all true. expect:#{[nil, true, 99].all?}; " \
     "actual: #{[nil, true, 99].my_all?} "
puts "works with no block when none false. expect: #{[].all?}; actual: #{[].my_all?}"
puts ""

puts "my_any? vs any?"
puts "works with block when something present. expect: #{animals.any? { |word| word.length >= 3 }}; " \
     "actual: #{animals.my_any? { |word| word.length >= 3 }}"
puts "works with block when something is present. expect: #{animals.any? { |word| word.length >= 4 }}; " \
     "actual: #{animals.my_any? { |word| word.length >= 4 }}"
puts "works with no block when something is present. expect:#{[nil, true, 99].any?}; " \
     "actual: #{[nil, true, 99].my_any?} "
puts "works with no block when none preset. expect: #{[].any?}; actual: #{[].my_any?}"
puts ""

puts "my_none? vs none?"
puts "works with block when none present. expect: #{animals.none? { |word| word.length == 5 }}; " \
     "actual: #{animals.my_none? { |word| word.length == 5 }}"
puts "works with block when something is present. expect: #{animals.none? { |word| word.length >= 4 }}; " \
     "actual: #{animals.my_none? { |word| word.length >= 4 }}"
puts "works with no block when something is present. expect:#{[nil, true, 99].none?}; " \
     "actual: #{[nil, true, 99].my_none?} "
puts "works with no block when none preset. expect: #{[].none?}; actual: #{[].my_none?}"
puts ""

puts "my_count vs count"
ary = [1, 2, 4, 2, nil]
puts "works with a block. expect: #{ary.count { |num| num.is_a?(Numeric) }};" \
     " actual: #{ary.my_count { |num| num.is_a?(Numeric) }}"
puts "works with no block or argument. expect: #{ary.count}; actual: #{ary.my_count}"
puts "works with argument. expect: #{ary.count(4)}; actual: #{ary.count(4)} "
puts ""

puts "my_map vs map"
puts "works with an array when given a block. expect: #{numbers.map { |i| i * i }}; " \
     "actual: #{numbers.my_map { |i| i * i }}"
puts "works with a range, given a block. expect: #{(1..4).map { |i| i * i }}; " \
     "actual: #{(1..4).my_map { |i| i * i }}"
puts ""

puts "my_inject vs inject"
puts "works with block. expect: #{(5..10).inject { |sum, n| sum + n }}; " \
     "actual: #{(5..10).my_inject { |sum, n| sum + n }}"


# if $PROGRAM_NAME == __FILE__
#   def run
#     tests = methods.select { |method| method.to_s.start_with?("test_") }
#     tests.each { |test| send(test) }
#   end

#   run
# end
