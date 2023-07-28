class AddColumnsToProgramSegments < ActiveRecord::Migration[7.0]
  def change
    add_column :program_segments, :segment_for_email, :string, null: false
    add_column :program_segments, :personality, :string, null: false
    add_column :program_segments, :image_url, :string, null: false
    add_column :program_segments, :official_site, :string, null: false
    add_column :program_segments, :instruction, :text
    add_column :program_segments, :official_site_instruction, :text
    add_column :program_segments, :default_sentence, :string
    add_column :program_segments, :goods_status, :string, null: false, default: :none
    add_column :program_segments, :day, :string, null: false
    add_column :program_segments, :starting_time, :time, null: false
  end
end
