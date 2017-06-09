require 'net/http'

describe 'Application' do
  it 'is up' do
    url = 'http://127.0.0.1:6001'
    uri = URI(url)

    code = Net::HTTP.get_response(uri).code

    expect(code).to eq('200')
  end
end
