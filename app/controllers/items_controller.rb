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
  end

  def create
    @item = Item.new(item_params)
    @item.category = Category.first

    if @item.save
      redirect_to @item
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
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
    params.require(:item).permit(:name, :price, :image, :description)
  end
end
