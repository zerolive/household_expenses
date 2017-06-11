require 'net/http'

describe 'Application' do
  it 'is up' do
    url = 'http://localhost:6001'
    uri = URI(url)

    code = Net::HTTP.get_response(uri).code

    expect(code).to eq('200')
  end
end
