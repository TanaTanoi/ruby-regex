#thing.rb
require_relative 'require_block'

x = Compiler.new("bc$").compile_regex

x.contained_in?("add*abc")
