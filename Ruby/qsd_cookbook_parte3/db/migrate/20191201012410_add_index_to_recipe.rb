class AddIndexToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :index, :string
    add_index :recipes, :index
  end
end
