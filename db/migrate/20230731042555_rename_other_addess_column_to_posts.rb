class RenameOtherAddessColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :other_addess, :other_address
  end
end
