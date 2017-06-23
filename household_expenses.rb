require_relative 'services/login/service'
require 'ostruct'

class HouseholdExpenses
  def call(env)
    path = env['PATH_INFO']
    params = Rack::Utils.parse_nested_query(env['QUERY_STRING'])
    return [200, {}, [readme_to_s]] if match?(path, '/')
    return [200, {}, [login_page]] if match?(path, '/login')
    return [200, {}, [home_page(params)]] if match?(path, '/home')
    return [404, {}, ['page not found']]
  end

  private

  def home_page(params)
    return login_page if conclusive?(params)

    path = 'app/views/home.html.erb'
    path_erb_file = File.expand_path(path)
    file = File.read(path_erb_file)
    variables = OpenStruct.new('email' => params['email'])
    ERB.new(file).result(variables.instance_eval { binding })
  end

  def login_page
    path = 'app/views/login.html'
    path_erb_file = File.expand_path(path)
    file = File.read(path_erb_file)
    ERB.new(file).result
  end

  def conclusive?(data)
    conclusion = LoginService.new(data['email'], data['password']).conclude
    conclusion['message'] == 'fail'
  end

  def match?(path, route)
    path == route || path == (route + '/')
  end

  def readme_to_s
    file = File.open("README.md", "rb")
    file.read
  end
end
