require 'rails_helper'

RSpec.describe 'Modals', type: :system do
  describe 'terms' do
    it 'displays the terms page' do
      visit '/terms'
      expect(page).to have_content('利用規約')
    end
  end

  describe 'privacy_policy' do
    it 'displays the privacy policy page' do
      visit '/privacy_policy'
      expect(page).to have_content('プライバシーポリシー')
    end
  end
end
