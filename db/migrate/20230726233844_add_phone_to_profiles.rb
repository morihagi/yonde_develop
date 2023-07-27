class AddPhoneToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :phone, :string
  end
end
