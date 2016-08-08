class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.includes(:category).find params[:id]
    @option_groups = @item.category.option_groups.joins(options: :option_values).where(option_values: {id: @item.option_value_ids}).includes(options: :option_values)
  end

  def new
    @item = Item.new
    @item.properties.build
    @category = Category.includes(option_groups: [options: [:option_element, option_values: :value_element]]).first
  end

  def edit
    @item = Item.includes(:category, option_groups: [options: [:option_element, option_values: :value_element]]).find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.save!
    redirect_to @item
  end

  private
    def item_params
      params.require(:item).permit(:name, :category_id, properties_attributes: [:option_value_id, option_value_attributes: [:option_id, :value]])
    end
end
