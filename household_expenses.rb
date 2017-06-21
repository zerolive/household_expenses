class HouseholdExpenses
  def call(env)
    path = env['PATH_INFO']
    params = env['QUERY_STRING']
    return [200, {}, [readme_to_s]] if path == '/'
    return [200, {}, [login_page]] if path == '/login'
    return [200, {}, [home_page(params)]] if path == '/validate_login'
    return [404, {}, ['page not found']]
  end

  private

  def home_page(params)
    path = 'app/views/home.html'
    path_erb_file = File.expand_path(path)
    file = File.read(path_erb_file)
    ERB.new(file).result    
  end

  def login_page
    path = 'app/views/login.html'
    path_erb_file = File.expand_path(path)
    file = File.read(path_erb_file)
    ERB.new(file).result
  end

  def readme_to_s
    file = File.open("README.md", "rb")
    file.read
  end
end
