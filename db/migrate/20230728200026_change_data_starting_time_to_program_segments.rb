class ChangeDataStartingTimeToProgramSegments < ActiveRecord::Migration[7.0]
  def change
    change_column :program_segments, :starting_time, :string, null: false
  end
end
