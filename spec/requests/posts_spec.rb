require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:author) {User.create(name: 'Malik44', photo: 'https://malik44.jpg', bio: 'Sailor')}
  let!(:post) {Post.create(title: 'Legacy', text: 'The legacy of the righteous is a blessing', author_id: author.id)}

  describe 'GET /users/:user_id/posts' do

    it 'works! (now write some real specs)' do
      get user_posts_path(user_id: author.id)
      expect(response).to have_http_status(200)
      expect(response).to render_template('posts/index')
      expect(response.body).to include('Malik44')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'works! (now write some real specs)' do
      get user_post_path(user_id: author.id, id: post.id)
      expect(response).to have_http_status(200)
      expect(response).to render_template('posts/show')
      expect(response.body).to include('Legacy')
    end
  end
end
