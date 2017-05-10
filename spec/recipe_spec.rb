require "spec_helper"

describe(Recipe) do
  describe('#ingredients') do
    it('will return all the recipes for a specific ingredient') do
      test_recipe = Recipe.create(name: "Killer Porkchops", instructions: "Kill, Cook, Eat")
      test_ingredient1 = Ingredient.create(name: "porkchop",  quantity: "2 lbs")
      test_ingredient2 = Ingredient.create(name: "salt", quantity: "1 tbs")
      test_recipe.ingredients.push(test_ingredient1, test_ingredient2)
      expect(test_recipe.ingredients).to(eq([test_ingredient1,test_ingredient2]))
    end
  end
end
