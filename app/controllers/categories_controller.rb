class CategoriesController < ApplicationController
=begin
  index
  new
  create
  show
  edit
  update
  destroy
=end
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_is_admin, except: [:index, :show]

  def index
    @categories = Category.all
    #Here '@categories' is the instance variable which will return an array of all objects from the Category model.
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "Successfully created #{@category.name}"
    else
      render action: "new"
    end
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products #This is an instance method. Another way of writing this is #Product.where('category_id = ?', @category.id)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    previous_name = @category.name
    if @category.update_attributes(category_params)
      redirect_to categories_path(@category.id), notice: "Successfully updated from #{previous_name} to #{@category.name}"
    else
      render action: "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: "Successfully deleted #{@category.name}"
  end

  private
  def category_params
    params[:category].permit(:name)
  end

end
