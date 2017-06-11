
class LoginService
  USERS = [
    {
      'email' => 'kirito@hoex.com',
      'password' => 'dual_sword'
    }
  ]

  FAIL_MESSAGE = 'fail'
  SUCCESS_MESSAGE = 'success'

  def initialize(email, password)
    @user = {
      'email' => email,
      'password' => password
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
