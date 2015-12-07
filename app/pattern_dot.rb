class PatternDot
  def matches?(scanner)
    scanner.scan! != nil
  end
end
