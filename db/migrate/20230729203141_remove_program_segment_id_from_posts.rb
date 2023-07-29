class RemoveProgramSegmentIdFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_reference :posts, :program_segment, null: false, foreign_key: true
  end
end
