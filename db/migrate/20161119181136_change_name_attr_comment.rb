class ChangeNameAttrComment < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :name, :title
  end
end
