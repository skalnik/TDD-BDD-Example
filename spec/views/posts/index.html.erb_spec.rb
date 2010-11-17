require 'spec_helper'

describe 'posts/index.html.erb' do
  it 'displays all the post titles and bodies' do
    posts = [ mock_model(Post, :title => 'Hello world!', :body => 'How are you world?'),
              mock_model(Post, :title => 'Ohai',         :body => 'Iz it caturday?') ]
    assign(:posts, posts)
    render
    rendered.should have_selector('a', :content => "Hello world!", :href => post_path(posts.first))
    rendered.should contain("How are you world?")
    rendered.should have_selector('a', :content => "Ohai",         :href => post_path(posts.last))
    rendered.should contain("Iz it caturday?")
  end
end
