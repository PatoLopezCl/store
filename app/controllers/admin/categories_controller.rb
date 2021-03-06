class Admin::CategoriesController < ApplicationController
  layout 'admin_layout'
  
  before_action :set_category, only: [:show, :edit, :update, :delete]
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
  end

  def edit
  end

  def create
    @category = Category.new(params_category)

    #  va con .save???
    if @category 
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def update
    if @category.update(params_category)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end

  private #apoyo

  def params_category
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  rescue # recata el error
    # el flash es como el mensajero de rails
    flash[:set_category_error] = "Could not find the record #{params[:id]}"
    redirect_to admin_categories_path
    
  end

end