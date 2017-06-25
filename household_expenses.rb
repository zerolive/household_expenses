require_relative 'services/login/service'
require_relative 'lib/action'

class HouseholdExpenses
  def call(env)
    path = env['PATH_INFO']
    params = Rack::Utils.parse_nested_query(env['QUERY_STRING'])

    response = {
      '/' => readme_to_s,
      '/login' => login_page,
      '/home' => home_page(params)
    }

    return page_not_found if response[path].nil?
    response[path]
  end

  private

  def home_page(params)
    return login_page unless conclusive?(params)

    email = { 'email' => params['email'] }
    Action.new('app/views/home.html.erb').do(params)
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
