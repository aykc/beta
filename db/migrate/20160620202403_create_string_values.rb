class CreateStringValues < ActiveRecord::Migration
  def change
    create_table :string_values do |t|
      t.string :value

      t.timestamps null: false
    end
  end
end
