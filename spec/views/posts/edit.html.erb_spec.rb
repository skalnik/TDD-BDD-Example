require 'spec_helper'

describe 'posts/edit.html.erb' do
  let(:post) { stub_model(Post, :title => 'Test', :body => 'wat') }

  before(:each) do
    assign :post, post
  end

  it 'renders a form to edit the post' do
    assign :post, post
    render
    rendered.should have_selector('form',
      :action => post_path(post.id)
    ) do |form|
      form.should have_selector('input',
        :type => 'hidden',
        :name => '_method',
        :value => 'put')
      form.should have_selector('input', :type => 'submit')
    end
  end

  it 'renders a text field for the post title' do
    render
    rendered.should have_selector('form') do |form|
      form.should have_selector('input',
        :type => 'text',
        :name => 'post[title]',
        :value => post.title)
    end
  end

  it 'renders a text area for the post body' do
    render
    rendered.should have_selector('form') do |form|
      form.should have_selector('textarea',
        :name => 'post[body]',
        :content => post.body)
    end
  end
end
