class AddAvatarToSpeeches < ActiveRecord::Migration[5.0]
  def change
    add_column :speeches, :avartar, :string
  end
end
