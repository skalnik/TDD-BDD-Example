require 'spec_helper'

describe 'posts/new.html.erb' do
  let(:post) { stub_model(Post).as_new_record }

  before(:each) do
    assign(:post, post)
  end

  it 'renders a form to create a new post' do
    render
    rendered.should have_selector('form',
      :method => 'post',
      :action => posts_path
    ) do |form|
      form.should have_selector('input', :type => 'submit')
    end
  end

  it 'renders a text field for the post title' do
    post.title = 'Awesome title'
    render
    rendered.should have_selector('form') do |form|
      form.should have_selector('input',
        :type => 'text',
        :name => 'post[title]',
        :value => 'Awesome title')
    end
  end

  it 'renders a text area for the post body' do
    post.body = 'Testing ftw'
    render
    rendered.should have_selector('form') do |form|
      form.should have_selector('textarea',
        :name => 'post[body]',
        :content => 'Testing ftw')
    end
  end
end
