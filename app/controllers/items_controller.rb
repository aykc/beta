class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find params[:id]
  end

  def new
    @item = Item.new
    @item.properties.build
    @category = Category.first
  end

  def create
    @item = Item.new(item_params)
    @item.save!
    redirect_to @item
  end

  private
    def item_params
      params.require(:item).permit(:name, :category_id, properties_attributes: [:option_value_id])
    end
end
