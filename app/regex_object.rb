class RegexObject

  def initialize(regex_patterns = [])
    @patterns = [regex_patterns].flatten
  end

  def add(regex_pattern)
    RegexObject.new(@patterns + [regex_pattern])
  end

  def contained_in?(source)
    scanner = Scanner.new(source)
    regex_index = 0
    #TODO refactor this nastay code
    while scanner.has_next? && regex_index < @patterns.length
      if @patterns[regex_index].matches?(scanner)
        regex_index += 1
      else
        regex_index = 0
      end
    end
    puts regex_index == @patterns.length
  end
end
