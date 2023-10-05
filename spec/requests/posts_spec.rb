require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:program) { create(:program) }
  let(:segment) { create(:segment) }
  let(:user) { create(:user) }
  let(:test_post) { create(:post, user:, segment:) }

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get posts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_post_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'returns http success' do
      post posts_path, params: { post: { body: 'Test Title', segment_id: segment.id, user_id: user.id } }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get post_path(id: test_post.id, locale: :ja)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get edit_post_path(id: test_post.id, locale: :ja)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH /update' do
    it 'returns http success' do
      patch post_path(id: test_post.id, locale: :ja), params: { post: { body: 'Updated Title', segment_id: segment.id, user_id: user.id } }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'DELETE /destroy' do
    it 'returns http success' do
      delete post_path(id: test_post.id, locale: :ja)
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'POST /duplicate' do
    it 'returns http success' do
      post duplicate_post_path(id: test_post.id, locale: :ja),
           params: { post: { body: 'Dupricated Title', segment_id: segment.id, user_id: user.id } }
      expect(response).to have_http_status(:redirect)
    end
  end
end
