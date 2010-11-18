Given /^posts titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
    Post.create!(:title => title, :body => 'yay!')
  end
end

Given /^a post titled "([^"]*)" with body "([^"]*)"$/ do |title, body|
  Post.create!(:title => title, :body => body)
end

When /^I create a new post titled "([^"]*)" with body "([^"]*)"$/ do |title, body|
  visit new_post_path
  fill_in 'Title', :with => title
  fill_in 'Body', :with => body
  click_button 'Save'
end
