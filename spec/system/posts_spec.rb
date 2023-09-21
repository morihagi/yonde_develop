require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let(:unregistered_user) { User.find(1) }
  let(:unregistered_post) { create(:post, user: unregistered_user) }
  let(:user) { create(:user) }
  let(:profile) { create(:profile, user_id: user.id) }
  let(:post) { create(:post, user: user) }

  describe "GET /index" do
    context "when user is signed in" do
      before do
        sign_in user
      end

      it "returns http success" do
        get posts_path
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not signed in" do
      it "redirects to sign in page" do
        get posts_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_post_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    context "when user is signed in" do
      before do
        sign_in user
      end

      let(:valid_attributes) {
        { prefecture: 'Tokyo', 
          city: 'Chiyoda', 
          radio_name: 'Radio', 
          zip_code: '1234567', 
          other_address: '1-1-1', 
          legal_name: 'Legal', 
          phone: '090-1234-5678', 
          body: 'This is a post.', 
          segment_id: 1, 
          residence_prefecture: 'Tokyo', 
          residence_city: 'Chiyoda'
        }
      }

      xit "creates a new post and redirects to the post" do
        expect {
          post posts_path, params: { post: valid_attributes }
        }.to change(Post, :count).by(1)
        expect(response).to redirect_to(post_path(Post.last))
      end

      let(:invalid_attributes) {
        { prefecture: nil,
          city: nil,
          radio_name: nil,
          zip_code: 'abc',
          other_address: nil,
          legal_name: nil, phone: nil,
          body: nil,
          segment_id: nil,
          residence_prefecture: nil,
          residence_city: nil
        }
      }

      xit "does not create a new post and returns unprocessable entity status" do
        expect {
          post :create, params: { post: invalid_attributes }
        }.to change(Post, :count).by(0)
      end

      xit 're-renders the "new" template' do
        post :create, params: { post: invalid_attributes }
        expect(response).to render_template('new')
      end
    end

    context "when user is not signed in" do
      let(:valid_attributes) {
        { prefecture: 'Tokyo',
          city: 'Chiyoda',
          radio_name: 'Radio',
          zip_code: '1234567',
          other_address: '1-1-1',
          legal_name: 'Legal',
          phone: '090-1234-5678',
          body: 'This is a post.',
          segment_id: 1,
          residence_prefecture: 'Tokyo',
          residence_city: 'Chiyoda'
        }
      }

      xit "creates a new post for unregistered user and redirects to show_for_guest_user_path" do
        expect {
          post posts_path, params: { post: valid_attributes }
        }.to change(Post, :count).by(1)
        expect(response).to redirect_to(show_for_guest_user_path)
      end

      let(:invalid_attributes) {
        { prefecture: nil, city: nil, radio_name: nil, zip_code: nil, other_address: nil, legal_name: nil, phone: nil, body: nil, segment_id:nil , residence_prefecture:nil , residence_city:nil }
      }

      xit "does not create a new post for unregistered user and returns unprocessable entity status" do
        expect {
          post posts_path, params:{post: invalid_attributes}
        }.to change(Post,:count).by(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end

      xit 're-renders the "new" template' do
        post :create, params: { post: invalid_attributes }
        expect(response).to render_template('new')
      end
    end
  end

  describe "GET /show" do
    context "when user is signed in" do
      before do
        sign_in user
      end

      it "returns http success" do
        get post_path(post)
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not signed in" do
      it "redirects to sign in page" do
        get post_path(post)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "GET /show_for_unregistered_user" do
    xit "returns http success for unregistered user's last post" do
      get show_for_guest_user_path(post)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    context "when user is signed in" do
      before do
        sign_in @user
      end

      xit "returns http success" do
        get edit_post_path(post)
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not signed in" do
      xit "redirects to sign in page" do
        get edit_post_path(post)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "PATCH /update" do
    context "when user is signed in" do
      before do
        sign_in user
      end

      let(:new_attributes) {
        { prefecture: 'Osaka', city: 'Osaka', radio_name: 'New Radio', zip_code: '987-6543', other_address: '2-2-2', legal_name: 'New Legal', phone: '080-9876-5432', body: 'This is a new post.', segment_id: 2, residence_prefecture: 'Osaka', residence_city: 'Osaka' }
      }

      xit "updates the requested post and redirects to the post" do
        patch post_path(post), params: { post: new_attributes }
        post.reload
        expect(response).to redirect_to(post_path(post))
      end

      let(:invalid_attributes) {
        { prefecture: nil, city: nil, radio_name: nil, zip_code: nil, other_address: nil, legal_name: nil, phone: nil, body: nil, segment_id:nil , residence_prefecture:nil , residence_city:nil }
      }

      xit "does not update the requested post and returns unprocessable entity status" do
        patch post_path(post), params:{post: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "when user is not signed in" do
      xit "redirects to sign in page" do
        patch post_path(post), params:{ post: { body: "New Body" } }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "DELETE /destroy" do
    before do
      sign_in user
    end

    context "when user is signed in" do
      xit "destroys the requested post and redirects to posts path" do
        expect {
          delete post_path(post)
        }.to change(Post, :count).by(-1)
        expect(response).to redirect_to(posts_path)
      end
    end

    context "when user is not signed in" do
      xit "redirects to sign in page" do
        delete post_path(post)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "GET /bookmarks" do
    context "when user is signed in" do
      before do
        sign_in user
      end

      xit "returns http success" do
        get bookmarks_posts_path
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not signed in" do
      xit "redirects to sign in page" do
        get bookmarks_posts_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "POST /duplicate" do
    let(:invalid_attributes) {
      { prefecture: nil, city: nil, radio_name: nil, zip_code: 'abc', 
        other_address: nil, legal_name: nil, phone: nil, body: nil, 
        segment_id:nil , residence_prefecture:nil , residence_city:nil }
    }

    before do
      sign_in user
    end

    context "when user is signed in" do
      xit "duplicates the requested post and redirects to posts path" do
        expect {
          post duplicate_post_path(post)
        }.to change(Post, :count).by(1)
        expect(response).to redirect_to(posts_path)

        allow_any_instance_of(Post).to receive(:save).and_return(false)
        post duplicate_post_path(post), params:{post: invalid_attributes}
        expect(response).to render_template(:index)
      end
    end

    context "when user is not signed in" do
      xit "redirects to sign in page" do
        post duplicate_post_path(post)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
