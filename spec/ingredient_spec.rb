require 'spec_helper'

describe(Ingredient) do
  describe('#recipes') do
    it('will return all the recipes for a specific ingredient') do
      test_ingredient = Ingredient.create(name: "porkchop", quantity: "1 lbs")
      test_recipe1 = Recipe.create(name: "Killer Porkchops", instructions: "Kill, Cook, Eat")
      test_recipe2 = Recipe.create(name: "Mac and Cheese", instructions: "cook pasta, mix in cheese, stir")
      test_ingredient.recipes.push(test_recipe1,test_recipe2)
      expect(test_ingredient.recipes).to(eq([test_recipe1,test_recipe2]))
    end
  end
end
