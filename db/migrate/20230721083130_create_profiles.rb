class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :email_for_post, null: true, comment: 'Email address for post'
      t.string :prefecture, null: true, comment: 'Prefecture'
      t.string :city, null: true, comment: 'City/Town/Village'
      t.string :radio_name, null: true, comment: 'Radio Name'
      t.integer :zip1, null: true, comment: 'First 3 digits of the postal code'
      t.integer :zip2, null: true, comment: 'Second 4 digits of the postal code'
      t.string :other_addess, null: true, comment: 'Additional address details'
      t.string :legal_name, null: true, comment: 'Full Name'
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
