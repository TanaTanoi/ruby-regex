class PatternLiteral
  attr_reader :char
  def initialize(char)
    @char = char
  end

  def matches?(scanner)
    @char == scanner.scan!
  end

  def to_s
     "PatternLiteral(#{@char})"
  end

  def inspect
     to_s
  end

end
