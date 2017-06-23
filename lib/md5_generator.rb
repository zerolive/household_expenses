require 'digest'

class MD5Generator
  class << self
    def encode(word)
      encode_to_md5(word)
    end

    private

    def encode_to_md5(word)
      Digest::MD5.hexdigest(word)
    end
  end
end
