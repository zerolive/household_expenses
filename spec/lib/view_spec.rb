require_relative '../../lib/view'

describe 'View' do
  it 'renders the file content' do
    view = View.new('spec/fixtures/views/view_fixture.html')

    erb = view.render

    expect(erb).to eq('view fixture')
  end

  it 'renders the file content with variables' do
    variable = 'variable as content'
    view = View.new('spec/fixtures/views/view_with_variables.html.erb')

    erb = view.render({ example: variable })

    expect(erb).to eq(variable)
  end
end
