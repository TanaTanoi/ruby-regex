class PatternPlus
  def initialize(pattern)
    @pattern = pattern
  end

  def matches?(scanner)
    matched = false
    while scanner.has_next? do
      result = @pattern.matches?(scanner)
      break if !result
      matched ||= result
    end
    scanner.move_back
    matched
  end

end
