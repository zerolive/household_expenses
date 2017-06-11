require_relative '../../../services/login/service'

describe 'Login service' do
  it 'concludes with a success message if a password belongs to a email' do
    email = 'kirito@hoex.com'
    password = 'dual_sword'
    success_message = {
      'email' => email,
      'message' => 'success'
    }
    login_service = LoginService.new(email, password)

    message = login_service.conclude

    expect(message).to eq(success_message)
  end

  it 'concludes with a fail message if a password belongs to a email' do
    email = 'kirito@hoex.com'
    password = 'wrong_password'
    fail_message = {
      'email' => email,
      'message' => 'fail'
    }
    login_service = LoginService.new(email, password)

    message = login_service.conclude

    expect(message).to eq(fail_message)
  end
end
