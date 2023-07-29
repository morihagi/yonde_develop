class RemoveZip2FromPostsandProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :zip2, :integer
    remove_column :profiles, :zip2, :integer
  end
end
