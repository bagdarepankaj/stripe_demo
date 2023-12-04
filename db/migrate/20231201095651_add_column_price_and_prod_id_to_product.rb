class AddColumnPriceAndProdIdToProduct < ActiveRecord::Migration[6.1]
  def change
  	add_column :products, :prod_id, :string
  	add_column :products, :price_id, :string
  end
end
