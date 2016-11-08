class ChangeTextToString < ActiveRecord::Migration[5.0]
  def change
    change_column :speeches, :content, :string
  end
end
