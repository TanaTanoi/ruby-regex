#thing.rb
require_relative 'require_block'

x = Compiler.new("ab?c").compile_regex

puts x.contained_in?("ac")
