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
    @product.quantity = 1
    @product.price = 0
    @product.list = @list
    if @product.save
      respond_to do|format|
        format.html {redirect_to list_path(@list), notice: 'Product was successfully created.'}
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find(params[:id].to_i)
    @list = List.find(params[:list_id].to_i) || List.find(params[:product][:list_id].to_i)
    @product.list = @list
    new_checked = params[:product][:checked]

    if @product.checked != params[:product][:checked]
      if new_checked
        @list.spent += @product.price
      elsif !new_checked && @list.spent >= 0
        @list.spent -= @product.price
      end
    end

    if @product.update(product_params)
      @list.save
      respond_to do |format|
        format.json { render json: { status: :ok } }
        format.html { redirect_to @product.list }
      end
    else
      render "lists/show", status: :unprocessable_entity, alert: flash[:alert] = "Product not updated!"
    end
  end

    def destroy
      @list = List.find(params[:list_id])
      @product = @list.products.find(params[:id])
      @product.destroy
      redirect_to @list, status: :see_other, notice: 'Product was successfully deleted.'
    end

    private
    def product_params
        params.require(:product).permit(:name, :brand, :quantity, :price, :checked, :list_id)
    end

end
