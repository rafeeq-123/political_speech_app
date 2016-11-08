class AddNameToSpeechTable < ActiveRecord::Migration[5.0]
  def change
    add_column :speeches, :name, :string
  end
end
