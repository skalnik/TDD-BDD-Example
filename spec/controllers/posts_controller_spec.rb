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

  describe 'PUT update' do
    let(:mock_post) { mock_model(Post, :title => 'Whoa', :body => 'Dude') }

    before do
      Post.stub(:find).with(mock_post.id).and_return(mock_post)
      mock_post.stub(:update_attributes).and_return(true)
    end

    it 'should retrieve the post' do
      Post.should_receive(:find).with(mock_post.id).and_return(mock_post)
      put 'update', :id => mock_post.id, :post => {}
    end

    it 'should update the post' do
      mock_post.should_receive(:update_attributes).with('title' => 'Updated!', 'body' => 'Brand new!').and_return(true)
      put 'update', :id => mock_post.id, :post => {:title => 'Updated!', :body => 'Brand new!'}
    end

    it 'should redirect to the post index' do
      put 'update', :id => mock_post.id, :post => {}
      response.should redirect_to(posts_path)
    end
  end

  describe 'DELETE destroy' do
    let(:mock_post) { mock_model(Post) }

    before do
      Post.stub(:find).with(mock_post.id).and_return(mock_post)
      mock_post.stub(:destroy).and_return(true)
    end

    it 'should retrieve the post' do
      Post.should_receive(:find).with(mock_post.id).and_return(mock_post)
      delete 'destroy', :id => mock_post.id
    end

    it 'should destroy the post' do
      mock_post.should_receive(:destroy).and_return(true)
      delete 'destroy', :id => mock_post.id
    end

    it 'should redirect to the post index' do
      delete 'destroy', :id => mock_post.id
      response.should redirect_to(posts_path)
    end
  end
end


