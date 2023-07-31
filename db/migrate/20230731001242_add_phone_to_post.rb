class AddPhoneToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :phone, :integer
  end
end
