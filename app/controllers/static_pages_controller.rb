class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!

  def top; end
  
  def about; end
  
  def info; end
end
