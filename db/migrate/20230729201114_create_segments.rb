class CreateSegments < ActiveRecord::Migration[7.0]
  def change
    create_table :segments do |t|
      t.string :segment_title, null: false
      t.string :segment_status, default: "ongoing", null: false
      t.string :segment_title_for_email, null: false
      t.text :instruction
      t.text :official_site_instruction
      t.string :default_sentence, null: false
      t.string :novelty_goods, default: "none", null: false
      t.references :program, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
