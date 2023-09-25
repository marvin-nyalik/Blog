require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns a 200 OK status' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'renders the view with specific HTML text' do
      get '/users'
      expect(response.body).to include('Here is a list of all users')
    end
  end

  describe 'GET /users/1' do
    it 'returns a 200 OK status' do
      get '/users/1'
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get '/users/1'
      expect(response).to render_template(:show)
    end

    it 'renders the view with specific HTML text' do
      get '/users/1'
      expect(response.body).to include('A specific user details')
    end
  end
end
