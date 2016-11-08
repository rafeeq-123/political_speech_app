class ReaddContentToSpeech < ActiveRecord::Migration[5.0]
  def change
    change_column :speeches, :content, :text
  end
end
