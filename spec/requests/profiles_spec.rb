require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET /show" do
    it "returns http success" do
      get profile_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get edit_profile_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit_for_goods" do
    it "returns http success" do
      get profile_edit_for_goods_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      patch profile_path, params: { profile: { zip_code: '1234567' } }
      expect(response).to redirect_to(profile_path)
    end

    it "returns unprocessable_entity status when update fails" do
      allow_any_instance_of(Profile).to receive(:update).and_return(false)
      patch profile_path, params: { profile: { zip_code: '1234567' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "PUT #update" do
    it "returns http success" do
      put profile_path, params: { profile: { zip_code: '1234567' } }
      expect(response).to redirect_to(profile_path)
    end

    it "returns unprocessable_entity status when update fails" do
      allow_any_instance_of(Profile).to receive(:update).and_return(false)
      put profile_path, params: { profile: { zip_code: '1234567' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end

