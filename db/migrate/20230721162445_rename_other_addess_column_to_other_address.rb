class RenameOtherAddessColumnToOtherAddress < ActiveRecord::Migration[7.0]
  def change
    rename_column :profiles, :other_addess, :other_address
  end
end
