class ListsController < ApplicationController
  include BudgetHelper
  helper_method :compare_budget

  def index
    session[:chosen_colors] ||= []
    @lists = List.all
    session[:chosen_colors] << @color
  end

  def show
    @list = List.find(params[:id])
    @review = Review.new
    @list_guest = @list.list_guests.new
    @list_guests = @list.list_guests.includes(:user)
  end

  def new
    @list = List.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    Rails.logger.info(@list.inspect)  # Log the list attributes before save
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  def reviews
    @list = List.find(params[:id])
    @reviews = @list.reviews
  end

  private

  def list_params
    params.require(:list).permit(:name, :access_type, :budget, :tag_id)
  end
end
