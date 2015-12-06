class RegexObject

  def initialize(regex_patterns = [])
    @patterns = [regex_patterns].flatten
  end

  def add(regex_pattern)
    RegexObject.new(@patterns + [regex_pattern])
  end

  def contained_in?(source)
    scanner = Scanner.new(source)
    source_index = 0
    regex_index = 0
    #TODO refactor this nastay code
    while source_index < source.length && regex_index < @patterns.length
      pat_result = @patterns[regex_index].matches?(scanner)
      if pat_result
        regex_index += 1
      else
        regex_index = 0
      end
    end
    regex_index == @patterns.length

  end
end
