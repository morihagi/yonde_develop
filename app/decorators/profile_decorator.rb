class ProfileDecorator < ApplicationDecorator
  delegate_all

  def full_address_post
    "#{model.prefecture}#{model.city}"
  end

  def full_address
    "#{model.prefecture}#{model.city}#{model.other_address}"
  end
end
