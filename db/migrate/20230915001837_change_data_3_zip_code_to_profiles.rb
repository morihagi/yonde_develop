class ChangeData3ZipCodeToProfiles < ActiveRecord::Migration[7.0]
  def change
    change_column :profiles, :zip_code, :string
  end
end
