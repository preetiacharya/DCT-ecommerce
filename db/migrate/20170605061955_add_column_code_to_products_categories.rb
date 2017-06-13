class AddColumnCodeToProductsCategories < ActiveRecord::Migration
  def change
    #add_column :table_name, column_name, :column_type
    add_column :categories, :code, :string
    add_column :products, :code, :string
  end
end
