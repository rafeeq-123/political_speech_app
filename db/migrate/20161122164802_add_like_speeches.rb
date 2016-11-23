class AddLikeSpeeches < ActiveRecord::Migration[5.0]
  def change
    add_column :speeches, :like, :integer
  end
end
