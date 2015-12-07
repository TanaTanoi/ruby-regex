#thing.rb
require_relative 'require_block'
regex = ARGV[0]
source = ARGV[1]
x = Compiler.new(regex).compile_regex

puts x.contained_in?(source)
