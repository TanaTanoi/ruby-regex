class PatternDot
  def initialize(pattern)
    @pattern = pattern
  end

  def matches?(scanner)
    matched = false
    while scanner.has_next? do
      result = @pattern.matches?(scanner)
      matched ||= result
    end
    true
  end

end
