class AddResidentAddressToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :residence_prefecture, :string
    add_column :profiles, :residence_city, :string
  end
end
