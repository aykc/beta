class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :category, foreign_key: true
      t.jsonb :details, null: false, default: '{}'

      t.timestamps
    end
    add_index :products, :details
  end
end
