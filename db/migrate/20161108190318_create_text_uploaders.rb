class CreateTextUploaders < ActiveRecord::Migration[5.0]
  def change
    create_table :text_uploaders do |t|

      t.timestamps
    end
  end
end
