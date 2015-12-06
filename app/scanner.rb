class Scanner
  def initialize(source)
    @source = source.char
    @index = 0
  end

  def scan!
    @index += 1
    @source.at(index - 1)
  end
end
