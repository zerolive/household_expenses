require_relative 'lib/routes'

class HouseholdExpenses
  def call(env)
    @env = env

    Routes.new(path, params).response
  end

  private

  def path
    @env['PATH_INFO']
  end

  def params
    Rack::Utils.parse_nested_query(@env['QUERY_STRING'])
  end
end
