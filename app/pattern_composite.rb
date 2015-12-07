class PatternComposite

  def initialize(patterns)
    @patterns = patterns
  end

  def matches?(scanner)
    regex_index = 0
    while scanner.has_next? && regex_index < @patterns.length
      if @patterns[regex_index].matches?(scanner)
        regex_index += 1
      else
        regex_index = 0
      end
    end
    regex_index == @patterns.length

  end

  def to_s
    "(#{@char})"
  end

  def inspect
  "PatternComposite(#{ @patterns.inject(""){|x,p| x+=p.to_s+ " " } })"

  end

end
