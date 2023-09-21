require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
  describe 'top' do
    it 'displays the top page' do
      visit '/'
      expect(page).to have_content('YONDEとは')
    end
  end
end
