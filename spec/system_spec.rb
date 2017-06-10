require_relative '../household_expenses'
require 'rack/test'

describe 'Application' do
  include Rack::Test::Methods

  it 'is up' do
    get '/'

    expect(last_response.ok?).to eq(true)
  end
end
