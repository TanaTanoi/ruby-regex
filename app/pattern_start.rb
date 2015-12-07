class PatternStart
  def matches?(scanner)
    scanner.scan! != nil
  end
end
