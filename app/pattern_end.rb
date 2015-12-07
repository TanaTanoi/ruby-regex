class PatternEnd
  def initialize(pattern)
    @pattern = pattern
  end

  def matches?(scanner)
    @pattern.matches?(scanner) && !scanner.has_next?
  end
end
