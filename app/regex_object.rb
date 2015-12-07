class RegexObject

  def initialize(regex_patterns = [])
    @patterns = [regex_patterns].flatten
    process_options
    print @patterns
  end

  def add(regex_pattern)
    RegexObject.new(@patterns + [regex_pattern])
  end

  def process_options
    @options = {}
    if @patterns.first.is_a? PatternStart
      @patterns.shift
      @options[:starts_with] = true
    elsif @patterns.last.is_a? PatternEnd
      @options[:ends_with] = true
    end
  end

  def contained_in?(source)
    scanner = Scanner.new(source)
    regex_index = 0
    #TODO refactor this nastay code
    while scanner.has_next? && (regex_index < @patterns.length || @options[:ends_with])
      if @patterns[regex_index].matches?(scanner)
        regex_index += 1
      else
        regex_index = 0
        return (puts "false")!=nil if @options[:starts_with]
      end
    end
    puts regex_index == @patterns.length
  end
end
