require 'spec_helper'

describe 'posts/new.html.erb' do
  it 'renders a form to create a new post' do
    render
    rendered.should have_selector('form',
      :method => 'post',
      :action => posts_path
    ) do |form|
      form.should have_selector('input', :type => 'submit')
    end
  end
end
