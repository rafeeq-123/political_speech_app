class DropAvatarColumnFromSpeechesTable < ActiveRecord::Migration[5.0]
  def up
    remove_column :speeches, :avartar
  end
end
