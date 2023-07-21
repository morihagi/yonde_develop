class CreateProgramSegments < ActiveRecord::Migration[7.0]
  def change
    create_table :program_segments do |t|
      t.string :email, null: false
      t.string :segment, null: false
      t.string :program, null: false
      t.string :segment_status, null: false, default: :ongoing
      t.string :program_status, null: false, default: :ongoing

      t.timestamps
    end
  end
end
