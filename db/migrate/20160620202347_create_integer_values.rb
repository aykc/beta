class CreateIntegerValues < ActiveRecord::Migration
  def change
    create_table :integer_values do |t|
      t.integer :value

      t.timestamps null: false
    end
  end
end
