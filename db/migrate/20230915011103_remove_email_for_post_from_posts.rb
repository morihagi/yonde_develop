class RemoveEmailForPostFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :email_for_post, :string
  end
end
