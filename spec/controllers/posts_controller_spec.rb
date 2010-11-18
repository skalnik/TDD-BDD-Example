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

  describe 'GET show' do
    let(:mock_post) { mock_model(Post) }

    it 'should be successful' do
      Post.stub(:find).with(mock_post.id).and_return(mock_post)
      get 'show', :id => mock_post.id
      response.should be_success
    end

    it 'should retrieve the post' do
      Post.should_receive(:find).with(mock_post.id)
      get 'show', :id => mock_post.id
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
    let(:mock_post) { mock_model(Post).as_null_object }

    before do
      Post.stub(:new).and_return(mock_post)
    end

    it 'should create a new message' do
      Post.should_receive(:new).
        with('title' => 'Testing rocks', 'body' => 'I love it!')
      post :create, :post => {'title' => 'Testing rocks', 'body' => 'I love it!'}
    end

    it 'should save the message' do
      mock_post.should_receive(:save)
      post :create
    end

    it 'should redirect to the posts index' do
      post :create
      response.should redirect_to(:action => 'index')
    end
  end

  describe 'GET edit' do
    let(:mock_post) { mock_model(Post) }

    it 'should be successful' do
      Post.stub(:find).with(mock_post.id).and_return(mock_post)
      get 'edit', :id => mock_post.id
      response.should be_success
    end

    it 'should retrieve the post' do
      Post.should_receive(:find).with(mock_post.id)
      get 'edit', :id => mock_post.id
    end
  end

  describe 'POST update' do
    it 'should retrieve the post'
    it 'should update the post'
    it 'should redirect to the post index'
  end
end


