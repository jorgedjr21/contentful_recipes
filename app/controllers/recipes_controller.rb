class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.load
  end

  def show; end
end