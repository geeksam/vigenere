require 'rubygems'
require 'rspec'
require 'vigenere'

describe VigenereCipher do
  context "with key 'LEMON'" do
    subject(:cipher) { VigenereCipher.new('LEMON') }

    it "should encrypt 'A'" do
      expect(cipher.encrypt('A')).to eq('L')
    end
    it "should decrypt 'L'" do
      expect(cipher.decrypt('L')).to eq('A')
    end

    it "should encrypt 'ATTAC' with key 'LEMON'" do
      expect(cipher.encrypt('ATTAC')).to eq('LXFOP')
    end

    # it "should decrypt 'HELLO' with key 'LEMON'"

    # it "should encrypt 'HELLOWORLD' with key 'LEMON'"
    # it "should decrypt 'HELLOWORLD' with key 'LEMON'"

    # it "should encrypt 'HELLO WORLD' with key 'LEMON'"
    # it "should decrypt 'HELLO WORLD' with key 'LEMON'"

    # it "should encrypt 'hello' with key 'LEMON'"
  end
end
