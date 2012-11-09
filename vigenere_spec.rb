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

    it "should decrypt 'LXFOP' with key 'LEMON'" do
      expect(cipher.decrypt('LXFOP')).to eq('ATTAC')
    end

    it "should encrypt 'HELLOWORLD' with key 'LEMON'" do
      key_padder = stub('Collator')
      cipher.should_receive(:key_padder).and_return(key_padder)
      key_padder.should_receive(:pad).with('LEMON', 'HELLOWORLD').and_return('LEMONLEMON')
      cipher.encrypt('HELLOWORLD')
      # expect(cipher.encrypt('HELLOWORLD').size).to eq('HELLOWORLD'.size)
      #expect(cipher.encrypt('HELLOWORLD')).to eq('HELLOWORLD')
    end

    # it "should decrypt 'HELLOWORLD' with key 'LEMON'"

    # it "should encrypt 'HELLO WORLD' with key 'LEMON'"
    # it "should decrypt 'HELLO WORLD' with key 'LEMON'"

    # it "should encrypt 'hello' with key 'LEMON'"
  end
end
