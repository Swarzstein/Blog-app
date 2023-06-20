require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(author_id: 1, title: 'Tanks', comments_counter: 0, likes_counter: 0) }

  before { subject.save }

  context 'when title is not present' do
    before { subject.title = nil }

    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end

  context 'when comments_counter is not a number' do
    before { subject.comments_counter = 'one' }

    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end

  context 'when comments_counter is less than 0' do
    before { subject.comments_counter = -1 }

    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end

  context 'post_counter_update' do
    let!(:author) { User.create name: 'Mosimosi', posts_counter: 0 }
    let!(:post) { Post.create author_id: author.id, title: 'Katakana', comments_counter: 0, likes_counter: 0 }

    it 'should increment posts_counter by one' do
      expect(post.post_counter_update.posts_counter).to eq(2)
    end
  end

  context 'recent_comments' do
    let!(:author) { User.create name: 'Ravan', posts_counter: 0 }
    let!(:post) { Post.create author_id: author.id, title: 'Wings of freedom', comments_counter: 0, likes_counter: 0 }
    let!(:comment) do
      Comment.create user_id: author.id, post_id: post.id, text: 'Hola!'
    end

    it 'should return recent comments' do
      expect(post.most_recent_comments).to eq([comment])
    end
  end
end
