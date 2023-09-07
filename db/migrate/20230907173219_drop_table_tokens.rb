class DropTableTokens < ActiveRecord::Migration[7.0]
  def change
    drop_table :tokens do |t|
      t.string :name, null: false
      t.timestamps null: false
      t.string "access_token"
      t.string "refresh_token"
      t.datetime "expires_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "user_id", null: false
      t.index ["user_id"], name: "index_tokens_on_user_id"
    end
  end
end
