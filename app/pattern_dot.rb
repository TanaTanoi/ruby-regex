class PatternDot
  def matches?(scanner)
    true if scanner.scan!
  end
end
