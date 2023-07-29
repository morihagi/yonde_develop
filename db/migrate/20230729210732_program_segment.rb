class ProgramSegment < ActiveRecord::Migration[7.0]
  def change
    drop_table :program_segments
  end
end
