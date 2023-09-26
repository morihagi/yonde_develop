# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  deleted_at             :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  locked_at              :datetime
#  oauth_expires_at       :datetime
#  oauth_token            :string
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  uid                    :string
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value('example@domain.com').for(:email) }
    it { should_not allow_value('invalid_email').for(:email) }

    context 'when the user is created via google registration' do
      let(:user) { create(:user, provider: 'google_oauth2') }

      it 'does not require a password' do
        expect(user).to be_valid
      end
    end

    context 'when the user is not created via google registration' do
      let(:user) { create(:user, provider: nil) }

      it 'requires a password' do
        expect(user).to validate_presence_of(:password)
      end

      it 'requires the user to agree to the terms and privacy policy' do
        user = build(:user, agreement: false)
        expect(user).not_to be_valid
        expect(user.errors[:agreement]).to include('に同意してください')
      end
    end
  end

  describe '.from_omniauth' do
    let(:auth_response) do
      OmniAuth::AuthHash.new(
        provider: 'google_oauth2',
        uid: '1234567',
        info: { email: 'test@example.com' },
        credentials: { token: 'mock_token', expires_at: Time.now.to_i + 1000 }
      )
    end

    context 'when the user already exists' do
      let!(:user) do
        create(:user, provider: auth_response.provider, uid: auth_response.uid, email: auth_response.info.email)
      end

      it 'returns the existing user' do
        expect(User.from_omniauth(auth_response)).to eq(user)
      end
    end

    context 'when the user does not exist' do
      it 'creates a new user' do
        expect do
          User.from_omniauth(auth_response)
        end.to change(User, :count).by(1)
      end

      it 'returns the created user' do
        expect(User.from_omniauth(auth_response)).to be_a(User)
      end
    end
  end
end
