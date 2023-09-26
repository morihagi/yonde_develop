require 'rails_helper'

RSpec.describe User, type: :request do
  describe 'GET /users/sign_up' do
    it 'renders the sign up page' do
      get new_user_registration_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /users' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          user: {
            email: 'test@exmple.com',
            password: 'password12',
            password_confirmation: 'password12',
            agreement: true,
            confirmed_at: Time.now
          }
        }
      end

      xit 'creates a new user' do
        expect { post user_registration_path, params: valid_params }.to change(User, :count).by(1)
      end

      xit 'redirects to the posts_path path' do
        post user_registration_path, params: valid_params
        expect(response).to redirect_to posts_path
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        {
          user: {
            email: '',
            password: '',
            password_confirmation: '',
            agreement: false
          }
        }
      end

      it 'does not create a new user' do
        expect do
          post user_registration_path, params: invalid_params
        end.not_to change(User, :count)
      end

      it 'renders the sign up page' do
        post user_registration_path, params: invalid_params
        expect(response).to render_template(:new)
      end
    end
  end
end
