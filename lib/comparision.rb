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
puts "my_all?, block, expect true: #{animals.my_all? { |word| word.length >= 3 }}"
puts "all?, block, expect true: #{animals.all? { |word| word.length >= 3 }}"
puts "my_all?, block, expect false: #{animals.my_all? { |word| word.length >= 4 }}"
puts "all?, block, expect false: #{animals.all? { |word| word.length >= 4 }}"
puts "my_all?, no block, expect false: #{[nil, true, 99].my_all?}"
puts "all?, no block, expect false: #{[nil, true, 99].all?}"
puts "my_all?, no block, expect true: #{[].my_all?}"
puts "all?, no block, expect true: #{[].all?}"
puts ""

puts "my_any? vs any?"
puts "my_any?, block, expect true: #{animals.my_any? { |word| word.length >= 3 }}"
puts "any?, block, expect true: #{animals.any? { |word| word.length >= 3 }}"
puts "my_any?, block, expect true: #{animals.my_any? { |word| word.length >= 4 }}"
puts "any?, block, expect true: #{animals.any? { |word| word.length >= 4 }}"
puts "my_any?, no block, expect true: #{[nil, true, 99].my_any?}"
puts "any?, no block, expect true: #{[nil, true, 99].any?}"
puts "my_any?, no block, expect false: #{[].my_any?}"
puts "any?, no block, expect false: #{[].any?}"
puts ""
# if $PROGRAM_NAME == __FILE__
#   def run
#     tests = methods.select { |method| method.to_s.start_with?("test_") }
#     tests.each { |test| send(test) }
#   end

#   run
# end
