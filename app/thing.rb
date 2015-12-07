#thing.rb
require_relative 'require_block'

x = Compiler.new("\\*").compile_regex

x.contained_in?("dd*abc")
