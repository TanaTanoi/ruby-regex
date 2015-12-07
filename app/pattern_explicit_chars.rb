class PatternExplicitChars

  def initialize(literals)
    @patterns = literals
  end

  def matches?(scanner)
    scanner.scan!
    @patterns.any? do |literal|
      scanner.move_back
      literal.matches?(scanner)
    end
  end
end
