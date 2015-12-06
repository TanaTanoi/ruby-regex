#thing.rb
require_relative 'require_block'

x = Compiler.new("ab+").compile_regex

x.contained_in?("fwgverabbbbfsfse")
