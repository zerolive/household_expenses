require_relative '../../lib/md5_generator'

class LoginService
  USERS = [
    {
      'email' => 'kirito@hoex.com',
      'password' => 'df6b10c1fd1a4d88d1173a06e8f5b23b'
    },
    {
      'email' => 'asuna@hoex.com',
      'password' => '8538f965f69793ecce96c7441a9a4798'
    }
  ]

  FAIL_MESSAGE = 'fail'
  SUCCESS_MESSAGE = 'success'

  def initialize(email, password)
    @user = {
      'email' => email,
      'password' => encode(password)
    }
  end

  def conclude
    return fail_message if user.nil?

    success_message
  end

  private

  def user
    USERS.find do |user|
      user['email'] == @user['email'] &&
      user['password'] == @user['password']
    end
  end

  def encode(password)
    MD5Generator.encode(password)
  end

  def fail_message
    {
      'email' => @user['email'],
      'message' => FAIL_MESSAGE
    }
  end

  def success_message
    {
      'email' => @user['email'],
      'message' => SUCCESS_MESSAGE
    }
  end
end
