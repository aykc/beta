class ProductsController < ApplicationController
  def show
    @product = Product.find params[:id]
  end

  def new
    @product = Product.new
    @category = Category.first
  end

  def create
    @product = Product.new(product_params)
    @p = product_params
    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find params[:id]
    @category = @product.category
  end

  def update
    @product = Product.find params[:id]
    @product.update_attributes(product_params)
    if @product.save
      redirect_to @product
    else
      render 'edit'
    end
  end

  public
    def product_params
      params.require(:product).permit(:id, :name, :category_id, details: permit_recursive_params(params[:product][:details]))
    end

    def permit_recursive_params(params)
      (params.try(:to_unsafe_h) || params).map do |key, value|
        if value.is_a?(Array)
          if value.first.respond_to?(:map)
            { key => [ permit_recursive_params(value.first) ] }
          else
            { key => [] }
          end
        elsif value.is_a?(Hash)
          { key => permit_recursive_params(value) }
        else
          key
        end
      end
    end
end
