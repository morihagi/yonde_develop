require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'sign up process' do
    it 'signs up a new user with valid information' do
      visit '/users/sign_up'

      fill_in 'Eメール', with: 'test@example.com'
      fill_in 'パスワード', with: 'password12'
      fill_in 'パスワード（確認用）', with: 'password12'
      find('#user_agreement').click

      click_button 'ユーザー登録'

      expect(page).to have_content('アカウント認証用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。')
    end

    it 'does not sign up a new user with invalid information' do
      visit '/users/sign_up'

      fill_in 'Eメール', with: ''
      fill_in 'パスワード', with: ''
      fill_in 'パスワード（確認用）', with: ''
      find('.agreement').click
      click_button 'ユーザー登録'

      expect(page).to have_content('Eメールを入力してください')
      expect(page).to have_content('Eメールが不正な値です')
      expect(page).to have_content('パスワードを入力してください')
      expect(page).to have_content('パスワードが不正な値です')
      expect(page).to have_content('パスワードは8文字以上で入力してください')
    end
  end

  describe 'User login information page' do
    let(:user) { create(:user) }

    it "displays the user's profile page" do
      sign_in user
      visit user_path
      expect(page).to have_content(user.email)
    end
  end
end
