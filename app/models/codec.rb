class Codec
  CODE = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
          .split(//)

  def self.encode(i)
    return CODE[0] if i == 0
    s = ""
    base = CODE.length
    while i > 0
      s << CODE[i % base]
      i /= base
    end
    s.reverse
  end

  def self.decode(s)
    i = 0
    base = CODE.length
    s.each_char { |c| i = i * base + CODE.index(c) }
    i
  end
end
