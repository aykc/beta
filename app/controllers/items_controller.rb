class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show

  end

  def new
    @item = Item.new
    @category = Category.first
  end
end
