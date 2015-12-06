class PatternPlus
  def initialize(pattern)
    @pattern = pattern
  end

  def matches?(scanner)
    matched? = false
    while scanner.has_next? do
      matched? ||= @pattern.matches?(scanner)
    end
    matched?
  end

end
