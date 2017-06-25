require_relative 'spec_helper'

describe 'Not found page' do
  it 'show when someone access an unkown route' do
    visit '/page/not/found'

    expect(page).to have_content('Page not found')
  end
end
