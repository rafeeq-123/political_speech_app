class ChangeNameOfColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :speeches, :avatar
  end
end
