require_relative 'spec_helper'

describe 'Login' do
  it 'can access with user and password' do
    user_email = 'kirito@hoex.com'
    password = 'dual_sword'
    visit('/login')

    fill_in('email', with: user_email)
    fill_in('password', with: password)
    click_on('Login')

    expect(page).to have_content(user_email)
  end

  it 'cannot access with wrong user' do
    user_email = 'wrong_user@hoex.com'
    password = 'dual_sword'
    visit('/login')

    fill_in('email', with: user_email)
    fill_in('password', with: password)
    click_on('Login')

    expect(page).to have_content('Login')
  end
end
