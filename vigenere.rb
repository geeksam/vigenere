class VigenereCipher
  def initialize(key)
    @cipher = key
  end

  def encrypt(plaintext)
    plainchars = plaintext.split('')
    keychars = @cipher.split('')
    pairs = plainchars.zip(keychars)
    encrypted_chars = pairs.map { |p, k| lookup_vigenere_value(p, k) }
    encrypted_chars.join
  end

  def decrypt(plaintext)
    'A'
  end

  private

  def lookup_vigenere_value(t, k)
    index_to_char((index_of(t) + index_of(k)) % 26)
  end

  # TODO: change from O(26) to O(1)
  ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  def index_of(a)
    ALPHABET.index(a)
  end

  def index_to_char(i)
    ALPHABET[i, 1]
  end
end
