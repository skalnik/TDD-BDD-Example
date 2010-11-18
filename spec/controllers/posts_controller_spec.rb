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

  describe 'GET new' do
    it 'should be successful' do
      get 'new'
      response.should be_success
    end

    it 'should create a new post object' do
      Post.should_receive(:new)
      get 'new'
    end
  end

  describe 'POST create' do
    it 'should create a new message'
    it 'should save the message'
    it 'should redirect to the posts index'
  end
end
