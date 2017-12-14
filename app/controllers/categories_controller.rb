class CategoriesController < ApplicationController
  
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5).order('id DESC')
    #.order('id DESC')       Inverte a ordem em que a lista é mostrada para paginate
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was successfully created"
      redirect_to categories_path
    else
      render 'new'
    end
  end
  
  def show
  end
  
  private
  def category_params
    params.require(:category).permit(:name)
  end
  
end