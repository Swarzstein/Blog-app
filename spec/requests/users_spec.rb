require 'rails_helper'

RSpec.describe 'Users', type: :request do

  let!(:user1) {User.create(name: 'Malik44', photo: 'https://malik44.jpg', bio: 'Sailor')}
  let!(:user2) {User.create(name: 'Akai321', photo: 'https://Akaiiii.jpg', bio: 'Martial Artist')}

  describe 'GET /users' do
    it 'works! (now write some real specs)' do
      get users_path
      expect(response).to have_http_status(200)
      expect(response).to render_template('users/index')
      expect(response.body).to include('Malik44')
      expect(response.body).to include('Akai321')
    end
  end

  describe 'GET /users/1' do
    it 'works! (now write some real specs)' do
      get user_path(user1.id)
      expect(response).to have_http_status(200)
      expect(response).to render_template('users/show')
      expect(response.body).to include('Malik44')
    end
  end
end
