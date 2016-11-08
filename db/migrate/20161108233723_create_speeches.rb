class CreateSpeeches < ActiveRecord::Migration[5.0]
  def change
    create_table :speeches do |t|

      t.timestamps
    end
  end
end
