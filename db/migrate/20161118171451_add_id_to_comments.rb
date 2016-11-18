class AddIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :speech_id, :integer
  end
end
