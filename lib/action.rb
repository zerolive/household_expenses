require_relative 'view'

class Action
  CODE = 200
  CONTENT = {}

  def initialize(path)
    @path = path
    @params = {}
  end

  def do(params = {})
    @params.merge!(params)
    response
  end

  private

  def response
    [CODE, CONTENT, [view]]
  end

  def view
    View.new(@path).render(@params)
  end
end
