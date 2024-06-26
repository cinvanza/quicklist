class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @list = List.find(params[:list_id])
  end


  def edit
    @product = Product.find(params[:id])
    @list = List.find(params[:list_id])
  end

  def create
    @product = Product.new(product_params)
    @list = List.find(params[:list_id])
    @product.list = @list
    if @product.save
      redirect_to list_path(@list), notice: 'Product was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find(params[:id])
    @list = List.find(params[:list_id])
    @product.list = @list
    @product.update(product_params)
    redirect_to list_path(@product.list)
  end

  def destroy
    @list = List.find(params[:list_id])
    @product = @list.products.find(params[:id])
    @product.destroy
    redirect_to @list, notice: 'Product was successfully deleted.'
  end

  private

  def product_params
    params.require(:product).permit(:name, :quantity, :price)
  end
end
