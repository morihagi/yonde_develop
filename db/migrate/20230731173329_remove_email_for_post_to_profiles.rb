class RemoveEmailForPostToProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :email_for_post
  end
end
