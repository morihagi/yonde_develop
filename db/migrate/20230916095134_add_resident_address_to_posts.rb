class AddResidentAddressToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :residence_prefecture, :string
    add_column :posts, :residence_city, :string
  end
end
