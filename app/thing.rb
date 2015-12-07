#thing.rb
require_relative 'require_block'

x = Compiler.new("(CcX){12}").compile_regex

puts x.contained_in?("CcX"*12)
