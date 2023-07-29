class RemovePostIdFromSegments < ActiveRecord::Migration[7.0]
  def change
    remove_reference :segments, :post, null: false, foreign_key: true
  end
end
