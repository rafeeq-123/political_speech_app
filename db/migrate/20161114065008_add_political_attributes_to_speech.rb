class AddPoliticalAttributesToSpeech < ActiveRecord::Migration[5.0]
  def change
    add_column :speeches, :political_stats, :text
    add_column :speeches, :text_of_uploaded_content, :text
  end
end
