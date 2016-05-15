class CreateOptionGroups < ActiveRecord::Migration
  def change
    create_table :option_groups do |t|
      t.string :name
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
