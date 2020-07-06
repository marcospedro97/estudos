class HomeController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def recipe
    @recipe = Recipe.find_by_index(params[:index])
  end
end
