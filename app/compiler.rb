
class Compiler
  SPECIAL_CHARS = {
    dot:  ".",
    plus: "+",
    star: "*",
    paren_open:   "(",
    paren_close:  ")",
    square_open:  "[",
    square_close: "]",
    literal: "\\",
    start_of_string: "^",
    end_of_string: "$",
    quant_open: "{",
    quant_close: "}",
    optional: "?",
  }


  def initialize(regex_string)
    @regex_char = regex_string.chars
  end

  def compile_regex
    @regex_patterns = []
    parse_char(@regex_char.shift) until @regex_char.empty?
    RegexObject.new(@regex_patterns)
  end

  def parse_char(char)
    if !SPECIAL_CHARS.has_value?(char)
      @regex_patterns.push PatternLiteral.new(char)

    elsif char == SPECIAL_CHARS[:start_of_string]
      @regex_patterns.push PatternStart.new

    elsif char == SPECIAL_CHARS[:optional]
      @regex_patterns[@regex_patterns.size-1] = PatternOptional.new(@regex_patterns.last)

    elsif char == SPECIAL_CHARS[:dot]
      @regex_patterns.push PatternDot.new

    elsif char == SPECIAL_CHARS[:plus]
      @regex_patterns.push PatternPlus.new(@regex_patterns.pop)

    elsif char == SPECIAL_CHARS[:star]
      @regex_patterns.push PatternStar.new(@regex_patterns.pop)

    elsif char == SPECIAL_CHARS[:literal]
      @regex_patterns.push PatternLiteral.new(@regex_char.first)
      @regex_char.shift

    elsif char == SPECIAL_CHARS[:end_of_string]
      @regex_patterns = [PatternEnd.new(PatternComposite.new(@regex_patterns))]

    elsif char == SPECIAL_CHARS[:paren_open]
      @regex_patterns.push(:paren_open_marker)

    elsif char == SPECIAL_CHARS[:paren_close]
      patterns = []
      patterns << @regex_patterns.pop until patterns.last == :paren_open_marker
      patterns.pop
      @regex_patterns.push PatternComposite.new(patterns.reverse)

    elsif char == SPECIAL_CHARS[:square_open]
      @regex_patterns.push(:square_open_marker)

    elsif char == SPECIAL_CHARS[:square_close]
      patterns = []
      patterns << @regex_patterns.pop until patterns.last == :square_open_marker
      patterns.pop
      @regex_patterns.push PatternExplicitChars.new(patterns.reverse)

    elsif char == SPECIAL_CHARS[:quant_open]
      @regex_patterns.push(:quant_open_marker)

    elsif char == SPECIAL_CHARS[:quant_close]
      patterns = []
      patterns << @regex_patterns.pop until patterns.last == :quant_open_marker
      patterns.reverse!.shift
      patterns = patterns.map { |p| p.char }.join.to_i
      (patterns - 1).times { @regex_patterns.push @regex_patterns.last }

    else
      fail "ur regex sux"

    end
  end

end
