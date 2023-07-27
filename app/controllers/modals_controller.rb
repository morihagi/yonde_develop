class ModalsController < ApplicationController
  skip_before_action :authenticate_user!

  def terms; end

  def privacy_policy; end

  def contact; end

  def developer; end
end
