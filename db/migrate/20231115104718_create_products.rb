class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name,			null: false, default: ''
      t.text :description,		null: false, default: ''
      t.integer :quantity,		null: false, default: 1
      t.float :price

      t.timestamps
    end
  end
end
