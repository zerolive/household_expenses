require_relative '../../lib/md5_generator'

describe 'MD5Generator' do
  it 'encodes a word to MD5' do
    word = 'some_word'
    digested_word = Digest::MD5.hexdigest(word)

    word_to_md5 = MD5Generator.encode(word)

    expect(word_to_md5).to eq(digested_word)
  end

  it 'encodes a void value as empty word' do
    void_word = nil
    empty_word = ''
    digested_word = Digest::MD5.hexdigest(empty_word)

    word_to_md5 = MD5Generator.encode(void_word)

    expect(word_to_md5).to eq(digested_word)
  end
end
