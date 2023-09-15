class ChangeDataZipCodeToProfiles < ActiveRecord::Migration[7.0]
  def change
    change_column :profiles, :zip_code, :integer
  end
end
