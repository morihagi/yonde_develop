class CreatePrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :programs do |t|
      t.string :program, null: false
      t.string :personality, null: false
      t.string :email, null: false
      t.string :image_url, null: false
      t.string :official_site, null: false
      t.string :day, null: false
      t.string :starting_time, null: false
      t.string :program_status, default: "ongoing", null: false

      t.timestamps
    end
  end
end
