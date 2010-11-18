require 'spec_helper'

describe 'posts/show.html.erb' do
  it 'displays the post title and body' do
    assign :post, mock_model(Post, :title => 'Woo tests', :body => 'Test...test...test...')
    render
    rendered.should contain('Woo tests')
    rendered.should contain('Test...test...test...')
  end

  it 'has an edit link'
  it 'has a link to the list of posts'
  it 'has a destroy link'
end
