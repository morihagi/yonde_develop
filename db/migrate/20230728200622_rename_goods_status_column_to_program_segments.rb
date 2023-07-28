class RenameGoodsStatusColumnToProgramSegments < ActiveRecord::Migration[7.0]
  def change
    rename_column :program_segments, :goods_status, :novelty_goods
  end
end
