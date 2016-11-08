class AddColumnAsTextInSpeeches < ActiveRecord::Migration[5.0]
  def change
    add_column :speeches, :content, :text
  end
end
