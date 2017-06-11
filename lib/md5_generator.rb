
class MD5Generator
  def self.encode(word)
    encode_to_md5(word)
  end

  private

  def self.encode_to_md5(word)
    Digest::MD5.hexdigest(word)
  end
end