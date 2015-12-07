#thing.rb
require_relative 'require_block'

x = Compiler.new("bc{2}").compile_regex

x.contained_in?("adbcabc")
