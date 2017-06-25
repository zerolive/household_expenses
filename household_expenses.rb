require_relative 'services/login/service'
require_relative 'lib/view'

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
    return login_page if conclusive?(params)

    email = { 'email' => params['email'] }
    [200, {}, [View.new('app/views/home.html.erb').render(email)]]
  end

  def login_page
    [200, {}, [View.new('app/views/login.html').render]]
  end

  def conclusive?(data)
    conclusion = LoginService.new(data['email'], data['password']).conclude
    conclusion['message'] == 'fail'
  end

  def page_not_found
    [404, {}, ['Page not found']]
  end

  def readme_to_s
    file = File.open("README.md", "rb")
    [200, {}, [file.read]]
  end
end
