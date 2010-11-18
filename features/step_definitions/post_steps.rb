Given /^posts titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
    Post.create!(:title => title, :body => 'yay!')
  end
end

