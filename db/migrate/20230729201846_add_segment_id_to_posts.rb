class AddSegmentIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :segment, foreign_key: true
  end
end

