class ChangePostsUserIdAndSegmentIdNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :posts, :user_id, false
    change_column_null :posts, :segment_id, false
  end
end
