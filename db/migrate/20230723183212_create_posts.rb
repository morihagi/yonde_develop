class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :email_for_post
      t.string :prefecture
      t.string :city
      t.string :radio_name
      t.integer :zip1
      t.integer :zip2
      t.string :other_addess
      t.string :legal_name
      t.string :favorite_status, null: false, default: :unlike
      t.string :post_status, null: false, default: :draft
      t.string :body
      t.references :user, null: false, foreign_key: true
      t.references :program_segment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
