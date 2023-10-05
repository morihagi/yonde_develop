require 'rails_helper'

RSpec.describe 'Profiles', type: :system do
  let(:user) { create(:user) }
  let(:profile) { create(:profile, user:) }

  before do
    sign_in user
  end

  describe 'GET /show' do
    it 'returns http success' do
      get profile_path(id: profile.id, locale: :ja)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get edit_profile_path(id: profile.id, locale: :ja)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit_for_goods' do
    it 'returns http success' do
      get profile_edit_for_goods_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { zip_code: '1234567', prefecture: 'Tokyo', city: 'Chiyoda', other_address: '1-1-1', radio_name: 'Radio',
          phone: '090-1234-5678', legal_name: 'Legal', residence_prefecture: 'Tokyo', residence_city: 'Chiyoda' }
      end

      it 'updates the requested profile and redirects to the profile' do
        patch profile_path, params: { profile: new_attributes }
        expect(response).to redirect_to(profile_path)
      end
    end

    context 'with invalid parameters' do
      let(:new_attributes) do
        { zip_code: 'a', prefecture: nil, city: nil, other_address: nil, radio_name: nil, phone: nil, legal_name: nil,
          residence_prefecture: nil, residence_city: nil }
      end

      it 'does not update the requested profile and returns unprocessable entity status' do
        patch profile_path, params: { profile: new_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
