class ChangeDefaultSentenceNullOnSegments < ActiveRecord::Migration[7.0]
  def change
    change_column_null :segments, :default_sentence, true
  end
end
