class AddAssociations < ActiveRecord::Migration[5.0]
  def change
    add_column :speeches, :user_id, :integer
    add_column :speeches, :avatar, :string
  end
end
