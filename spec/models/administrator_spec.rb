# == Schema Information
#
# Table name: administrators
#
#  id                        :integer          not null, primary key
#  email                     :string
#  first_name                :string
#  last_name                 :string
#  password_digest           :string
#  remember_token            :string
#  remember_token_expires_at :datetime
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
require 'rails_helper'

RSpec.describe Administrator, type: :model do
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:first_name) }
  it { is_expected.to respond_to(:last_name) }
  it { is_expected.to respond_to(:password_digest) }
  it { is_expected.to respond_to(:remember_token) }
  it { is_expected.to respond_to(:remember_token_expires_at) }

  it 'includes Trestle::Auth::ModelMethods' do
    expect(Administrator.ancestors.include?(Trestle::Auth::ModelMethods)).to be_truthy
  end

  it 'includes Trestle::Auth::ModelMethods::Rememberable' do
    expect(Administrator.ancestors.include?(Trestle::Auth::ModelMethods::Rememberable)).to be_truthy
  end
end
