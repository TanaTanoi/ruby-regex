class PatternStar
  def initialize(pattern)
    @pattern = pattern
  end

  def matches?(scanner)
    while scanner.has_next? do
      @pattern.matches?(scanner)
    end
    true
  end

end
