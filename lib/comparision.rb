# frozen_string_literal: true

require_relative "./enumerables"

numbers = [44, 66, 9, 12]

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
puts "#{numbers.my_select { |num| num.even? }}"
puts "#{numbers.select { |num| num.even?}}"

# if $PROGRAM_NAME == __FILE__
#   def run
#     tests = methods.select { |method| method.to_s.start_with?("test_") }
#     tests.each { |test| send(test) }
#   end

#   run
# end
