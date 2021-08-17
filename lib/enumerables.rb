# frozen_string_literal: true

# Add custom methods to replicate some of the functionality of the built in
# Enumerable module
module Enumerable
  # rubocop:disable Style/For
  def my_each
    for element in self
      yield element
    end
  end

  def my_each_with_index
    for index in 0..(self.length - 1)
      yield(self[index], index)
    end
  end

end
