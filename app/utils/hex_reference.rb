module HexReference
  LETTERS = ('A'..'Z').to_a.freeze

  def self.generate
    [
      random_chars,
      random_hex,
      random_chars,
      random_hex,
      random_chars
    ].join('-')
  end

  def self.random_hex
    SecureRandom.hex(1)
  end

  def self.random_chars
    # LETTERS.sample(3) gives a string without duplications
    (1..3).map { LETTERS.sample }.join
  end
end
