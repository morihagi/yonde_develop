class ChangeData2ZipCodeToProfiles < ActiveRecord::Migration[7.0]
  def change
    change_column :profiles, :zip_code, :text
  end
end
