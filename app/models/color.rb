class Color
  class << self
    def load(string)
      new(string) if string
    end

    def dump(color)
      color.to_s if color
    end
  end

  attr_reader :string, :hex

  def initialize(string)
    @string = string
    @hex = string.delete('#').to_i(16)
  end

  def to_s
    @string
  end
  alias inspect to_s

  def ==(other)
    case other
    when String
      string == other.string
    else
      super
    end
  end

  def light?
    @light ||= begin
      r = hex >> 16
      g = hex >> 8 & 255
      b = hex & 255

      hsp = Math.sqrt(
        0.299 * (r * r) +
        0.587 * (g * g) +
        0.114 * (b * b)
      )

      hsp > 127.5
    end
  end

  def dark?
    not light?
  end
end