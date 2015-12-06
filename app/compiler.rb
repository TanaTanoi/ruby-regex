
class Compiler
  SPECIAL_CHARS = {
    dot:  ".",
    plus: "+",
    star: "*",
    paren_open:   "(",
    paren_close:  ")",
    square_open:  "[",
    square_close: "]"
  }


  def initialize(regex_string)
    @regex_char = regex_string.chars
  end

  def compile_regex
    @regex_patterns = []
    @regex_char.each_with_index do |c,i|
        parse_char(c)
    end
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
    else
      fail "ur regex sux"
    end

  end

end
