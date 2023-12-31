module LoginMacros
  def login_admin
    @request.env['devise.mapping'] = Devise.mappings[:admin]
    admin = create(:admin)
    sign_in :user, admin
  end

  def login_user
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = create(:user)
    user.confirm!
    sign_in user
  end
end
