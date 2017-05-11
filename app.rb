require "bundler/setup"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get "/" do
  erb :index
end

get "/recipes" do
  @all_recipes = Recipe.all
  erb(:recipes)
end

get "/recipe/new" do
  @all_ingredients = Ingredient.all
  erb(:new_recipe)
end

post "/recipe/new" do
  recipe_name = params['recipe_name']
  new_recipe = Recipe.create(name: recipe_name, rating: 10)
  redirect "/"
end

get "/recipe/:id" do
  @all_ingredients = Ingredient.all
  @recipe = Recipe.find(params['id'])
  erb(:recipe)
end

post "/recipe/:id/ingredients/add" do
  @recipe = Recipe.find(params['id'])
  ingredient = params['ingredient']
  Ingredient.create(name: ingredient)
  redirect "/recipe/#{@recipe.id}"
end

post "/recipe/:id/ingredients/select" do
  @recipe = Recipe.find(params['id'].to_i)
  ingredient_ids = params.fetch("recipe_ingredients")
  ingredient_ids.map { |ingredient_id| @recipe.ingredients.push(Ingredient.find(ingredient_id))  }
  redirect "/recipe/#{@recipe.id}"
end

post "/recipe/:id/instructions/add" do
  @recipe = Recipe.find(params['id'].to_i)
  instructions = params['instructions']
  @recipe.update(instructions: instructions)
  redirect "/recipe/#{@recipe.id}"
end

post "/recipe/:id/tags/add" do
  @recipe = Recipe.find(params['id'].to_i)
  tag = params['tag']
  @recipe.tags.push(Tag.new(category: tag))
  redirect "/recipe/#{@recipe.id}"
end

patch "/recipe/:id/ingredient/delete" do
  @recipe = Recipe.find(params['id'].to_i)
  ingredient = Ingredient.find(params['ingredient_id'])
  @recipe.ingredients.delete(ingredient)
  redirect "/recipe/#{@recipe.id}"
end

patch "/recipe/:id/instruction/delete" do
  @recipe = Recipe.find(params['id'].to_i)
  instructions = params["instructions"]
  @recipe.instructions.delete(instructions)
  redirect "/recipe/#{@recipe.id}"
end

get "/recipe/:id/edit" do
  @recipe = Recipe.find(params['id'].to_i)
  erb(:edit_recipe)
end

patch "/recipe/:id/edit" do
  @recipe = Recipe.find(params['id'].to_i)
  name = params['recipe_name']
  if name == ""
    name = @recipe.name
  end
  instructions = params['instructions']
  if instructions == ""
    instructions = @recipe.instructions
  end
  @recipe.update(name: name, instructions: instructions)
  redirect "/"
end

delete "/recipe/:id/delete" do
  @recipe = Recipe.find(params['id'].to_i)
  @recipe.delete
  redirect "/"
end

get "/tags" do
  @all_tags = Tag.all
  erb(:tags)
end

get "/tag/:id" do
  @tag = Tag.find(params['id'])
  @all_recipes = Recipe.all
  erb(:recipe_tags)
end

get "/ingredients" do
  @all_ingredients = Ingredient.all
  erb(:ingredients)
end

get "/ingredient/:id" do
  @ingredient = Ingredient.find(params['id'].to_i)
  erb(:ingredient)
end
