class ChangeDataZip2ToPostsAndProfiles < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :zip1, :string
    change_column :profiles, :zip1, :string

    rename_column :posts, :zip1, :zip_code
    rename_column :profiles, :zip1, :zip_code
  end
end
