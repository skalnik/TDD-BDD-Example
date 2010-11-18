require 'spec_helper'

describe 'posts/show.html.erb' do
  let(:mock_post) { mock_model(Post, :title => 'Woo tests', :body => 'Test...test...test...') }

  before(:each) do
    assign :post, mock_post
  end

  it 'displays the post title and body' do
    render
    rendered.should contain('Woo tests')
    rendered.should contain('Test...test...test...')
  end

  it 'has an edit link' do
    render
    rendered.should have_selector('a', :content => 'Edit', :href => edit_post_path(mock_post))
  end

  it 'has a link to the list of posts' do
    render
    rendered.should have_selector('a', :content => 'List of Posts', :href => posts_path)
  end

  it 'has a destroy link' do
    render
    rendered.should have_selector('a', :content => 'Destroy')
  end
end
