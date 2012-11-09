class VigenereCipher
  def initialize(key)
    @key = key
  end

  def encrypt(plaintext)
    transform(plaintext, :encipher)
  end

  def decrypt(ciphertext)
    transform(ciphertext, :decipher)
  end

  private

  def transform(text, direction)
    pairs = collate(text, @key)
    pairs.map { |a, b| vigenere_lookup(a, b, direction) }.join
  end

  def collate(text, key)
    chars = text.split('')
    keychars = key.split('')
    pairs = chars.zip(keychars)
  end

  def vigenere_lookup(t, k, direction)
    x = index_of(t) + index_of(k) * sign(direction)
    index_to_char(x)
  end

  def sign(direction)
    :encipher == direction ? 1 : -1
  end

  # TODO: change from O(26) to O(1)
  ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  def index_of(a)
    ALPHABET.index(a)
  end

  def index_to_char(x)
    i = x % 26
    ALPHABET[i, 1]
  end
end
