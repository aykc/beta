class CreateTextOptions < ActiveRecord::Migration
  def change
    create_table :text_options do |t|

      t.timestamps null: false
    end
  end
end
