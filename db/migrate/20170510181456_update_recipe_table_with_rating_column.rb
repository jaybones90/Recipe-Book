class UpdateRecipeTableWithRatingColumn < ActiveRecord::Migration[5.1]
  def change
    add_column(:recipes, :rating, :string)
  end
end
