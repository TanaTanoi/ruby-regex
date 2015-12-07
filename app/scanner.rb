class Scanner
  def initialize(source)
    @source = source.chars
    @index = 0
  end

  def scan!
    @index += 1
    @source.at(@index - 1)
  end

  def has_next?
    @index < @source.length
  end

  def move_back
    @index -= 1
  end
end
