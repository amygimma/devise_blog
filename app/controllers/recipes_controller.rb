class RecipesController < ApplicationController
  
  
  def show
    recipe_id = params["id"]
    @recipe = Recipe.find(recipe_id)
  end

  def create
    if not user_signed_in?
      redirect_to new_user_session_path
    else
      @user = current_user
      @recipe = @user.recipes.build(recipe_params)
      @recipe.save
      
      redirect_to @recipe
    end
  end

  def update
    if not user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def destroy
    if not user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def index
    @recipes = Recipe.all()
  end

  def new
    if not user_signed_in?
      redirect_to new_user_session_path
    end
    @recipe = Recipe.new
  end

  def edit
    if not user_signed_in?
      redirect_to new_user_session_path
    end
  end
  
  private

    def recipe_params
      params.require(:recipe).permit(:title, :notes, :instructions,
                                   :estimated_time)
    end
end
