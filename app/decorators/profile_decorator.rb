class ProfileDecorator < ApplicationDecorator
  delegate_all

  def full_address_post
    "#{model.prefecture}#{model.city}"
  end

  def full_zip
    "#{model.zip1}-#{model.zip2}" if zip1.presence
  end

  def full_address
    "#{model.prefecture}#{model.city}#{model.other_address}"
  end
end
