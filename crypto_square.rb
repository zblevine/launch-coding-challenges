class Crypto
  attr_reader :str, :np

  def initialize(str)
    @str = str
    @np = normalize_plaintext
  end

  def normalize_plaintext
    str.downcase.gsub(/[^0-9a-z]/, '')
  end

  def size
    Math.sqrt(np.length).ceil
  end

  def plaintext_segments
    segments = np.scan(/#{'.' * size}/)
    remainder = np.length % size
    remainder == 0 ? segments : segments << np[-(remainder)..-1]
  end

  def cipher_array
    word_arrs = plaintext_segments.map { |str| str.chars }
    word_arrs.shift.zip(*word_arrs).map { |arr| arr.join }
  end

  def ciphertext
    cipher_array.join
  end

  def normalize_ciphertext
    cipher_array.join(' ')
  end
end
