require_relative '../services/login/service'
require_relative 'action'

class Routes
  def initialize(path, params)
    @path = path
    @params = params
  end

  def response
    response_by_route
  end

  private

  def response_by_route
    response = {
      '/' => readme_to_s,
      '/login' => login_page,
      '/home' => home_page
    }

    return page_not_found if response[@path].nil?
    response[@path]
  end

  def home_page
    return login_page unless conclusive?(@params)

    email = { 'email' => @params['email'] }
    Action.new('app/views/home.html.erb').do(@params)
  end

  def login_page
    Action.new('app/views/login.html').do
  end

  def conclusive?(data)
    conclusion = LoginService.new(data['email'], data['password']).conclude
    conclusion['message'] == 'success'
  end

  def page_not_found
    [404, {}, ['Page not found']]
  end

  def readme_to_s
    file = File.open("README.md", "rb")
    [200, {}, [file.read]]
  end
end
