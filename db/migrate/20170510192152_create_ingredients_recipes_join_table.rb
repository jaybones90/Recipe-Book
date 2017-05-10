class CreateIngredientsRecipesJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :ingredients, :recipes
  end
end
