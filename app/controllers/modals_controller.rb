class ModalsController < ApplicationController
  skip_before_action :authenticate_user!

  def terms; end

  def privacy_policy; end

  def developer; end

  def contact; end
end
