class ItemsController < ApplicationController
  before_action :require_user, except: [:index]
  before_action :is_admin?, except: [:index, :show]

  def index
    @items = Item.all
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create
    @item = Item.new(item_params)
    @categories = Category.all
    @item.category = Category.find(params[:item][:category_id])

    if @item.save
      flash[:success] = "Item created successfully"
      redirect_to @item
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
    @categories = Category.all
  end

  def update
    @item = Item.find(params[:id])
    @categories = Category.all
    if @item.update(item_params)
      flash[:success] = "Item updated successfully"
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = "Item deleted successfully"
    redirect_to root_path, status: :see_other
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :image, :description, :category_id)
  end
end
