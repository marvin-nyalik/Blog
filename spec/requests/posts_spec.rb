require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/1/posts' do
    it 'returns a 200 OK status' do
      get '/users/1/posts'
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get '/users/1/posts'
      expect(response).to render_template(:index)
    end

    it 'renders the view with specific HTML text' do
      get '/users/1/posts'
      expect(response.body).to include('Heres a list of all posts for a specific user')
    end
  end

  describe 'GET /users/1/posts/1' do
    it 'returns a 200 OK status' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get '/users/1/posts/1'
      expect(response).to render_template(:show)
    end

    it 'renders the view with specific HTML text' do
      get '/users/1/posts/1'
      expect(response.body).to include('Here shows the specific post for a user')
    end
  end
end
