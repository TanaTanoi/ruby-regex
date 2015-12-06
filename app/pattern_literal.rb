class PatternLiteral

  def initialize(char)
    @char = char
  end

  def matches?(scanner)
    @char == scanner.scan!
end
