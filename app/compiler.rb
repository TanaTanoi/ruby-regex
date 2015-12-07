
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
    elsif char == SPECIAL_CHARS[:dot]
      @regex_patterns.push PatternDot.new
    elsif char == SPECIAL_CHARS[:plus]
      @regex_patterns[@regex_patterns.size-1] = PatternPlus.new(@regex_patterns.last)
    elsif char == SPECIAL_CHARS[:star]
      @regex_patterns[@regex_patterns.size-1] = PatternStar.new(@regex_patterns.last)
    elsif char == SPECIAL_CHARS[:literal]
      @regex_patterns.push PatternLiteral.new(@regex_char.first)
      @regex_char.shift
    elsif char == SPECIAL_CHARS[:start_of_string]
      @regex_patterns.push PatternStart.new
    else
      fail "ur regex sux"
    end
  end

end
