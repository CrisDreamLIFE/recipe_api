class Api::V1::RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  def index
    @recipes = Recipe.all
    render json: @recipes, status: :ok
  end

  def show
    render json: @recipe, status: :ok
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      render json: @recipe, status: :created
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  def update
    if @recipe.update(recipe_params)
      render json: @recipe, status: :ok
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    head :no_content
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:portions, :preparation, :category_id, tag_ids: [], ingredients_attributes: [:material_id, :quantity, :measurement_unit_id])
  end
end
