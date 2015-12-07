class PatternOptional
  def initialize(pattern)
    @pattern = pattern
  end

  def matches?(scanner)
    @pattern.matches?(scanner) != nil
    #  scanner.move_back
    #end
    #true
  end
end
