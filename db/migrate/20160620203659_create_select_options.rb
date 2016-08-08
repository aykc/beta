class CreateSelectOptions < ActiveRecord::Migration
  def change
    create_table :select_options do |t|

      t.timestamps null: false
    end
  end
end
