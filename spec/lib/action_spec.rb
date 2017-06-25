require_relative '../../lib/action'

describe 'Action' do
  it 'returns a response code' do
    response_code = 200
    action = Action.new('spec/fixtures/views/view_fixture.html')

    result = action.do

    expect(result[0]).to eq(response_code)
  end

  it 'returns a content' do
    content = {}
    action = Action.new('spec/fixtures/views/view_fixture.html')

    result = action.do

    expect(result[1]).to eq(content)
  end

  it 'returns a rendered view' do
    rendered_view = ['view fixture']
    action = Action.new('spec/fixtures/views/view_fixture.html')

    result = action.do

    expect(result[2]).to eq(rendered_view)
  end

  it 'returns a rendered view with params' do
    rendered_view_with_params = ['example']
    params = { 'example' => 'example' }
    action = Action.new('spec/fixtures/views/view_with_variables.html.erb')

    result = action.do(params)

    expect(result[2]).to eq(rendered_view_with_params)
  end
end
