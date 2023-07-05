require 'rails_helper'

describe 'User Post Show Page', type: :feature do
  before :each do
    user1 = User.create(name: 'Akai321', photo: 'https://Akaiiii.jpg', bio: 'Martial Artist')
    user2 = User.create(name: 'Kuro321', photo: 'https://Kuroooo.jpg', bio: 'Jiu Jitsu Master')
    user3 = User.create(name: 'Bonzai73', photo: 'https://bon-bon.jpg', bio: 'Monk of the mountains')
    post = Post.create(author_id: user1.id, title: 'The way of the Water',
                       text: 'In martial arts, the way of the water is the way of the soft and yielding')
    Comment.create(user_id: user2.id, post_id: post.id,
                   text: 'Respects for Chinese martial arts, but I prefer Japanese')
    Comment.create(user_id: user3.id, post_id: post.id, text: 'I like both!')
    Like.create(user_id: user1.id, post_id: post.id)
    Like.create(user_id: user2.id, post_id: post.id)
    visit user_posts_path(user1.id, post.id)
  end

  scenario "I can see the post's title" do
    expect(page).to have_content('The way of the Water')
  end

  scenario 'I can see who wrote the post' do
    expect(page).to have_content('Akai321')
  end

  scenario 'I can see how many comments it has' do
    expect(page).to have_content('Comments: 2')
  end

  scenario 'I can see how many likes it has' do
    expect(page).to have_content('Likes: 2')
  end

  scenario 'I can see the post body' do
    expect(page).to have_content('In martial arts, the way of the water is the way of the soft and yielding')
  end

  scenario 'I can see the username of each commentor' do
    expect(page).to have_content('Kuro321')
    expect(page).to have_content('Bonzai73')
  end

  scenario 'I can see the comment each commentor left' do
    expect(page).to have_content('Respects for Chinese martial arts, but I prefer Japanese')
    expect(page).to have_content('I like both!')
  end
end
