require 'ostruct'
require 'erb'

class View
  def initialize(path)
    @path = path
    @variables = {}
  end

  def render(variables = {})
    @variables.merge!(variables)
    erb_result
  end

  private

  def erb_result
    ERB.new(file).result(
      variables_for_view.instance_eval { binding }
    )
  end

  def variables_for_view
    OpenStruct.new(@variables)
  end

  def file_path
    File.expand_path(@path)
  end

  def file
    File.read(file_path)
  end
end
