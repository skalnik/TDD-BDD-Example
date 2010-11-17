require 'spec_helper'

describe PostsController do
  describe 'GET index' do
    it 'should be successful' do
      get 'index'
      response.should be_success
    end

    it 'should display recent posts' do
      Post.should_receive(:find).with(:all)
      get 'index'
    end
  end
end
