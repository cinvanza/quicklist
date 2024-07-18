class ListGuestsController < ApplicationController
  before_action :authenticate_user! # si estás usando Devise
  before_action :set_list

  def new
    @list = List.find(params[:list_id])
    @list_guest = ListGuest.new
  end

  def create
    @list = List.find(params[:list_id])
    guest_name = params[:guest_name]

    if guest_name.blank?
      flash[:alert] = "Guest name cannot be blank."
    else
      user = User.find_by(first_name: guest_name)

      if user.nil?
        flash[:alert] = "No user found with this name."
      elsif ListGuest.exists?(list: @list, user: user)
        flash[:alert] = "This guest is already in the list."
      else
        @list_guest = ListGuest.new(user: user, list: @list)

        if @list_guest.save
          flash[:notice] = "Guest was successfully added to the list."
        else
          flash[:alert] = "Failed to add guest to the list."
        end
      end
    end

    redirect_to list_path(@list)
  end

  def destroy
    @list_guest = ListGuest.find(params[:id])
    @list = @list_guest.list
    @list_guest.destroy
    redirect_to @list, notice: 'Guest was successfully removed.'
  end

  def check_guest
  @list = List.find(params[:list_id])
  user = User.find_by(first_name: params[:name])
  guest_exists = user && ListGuest.exists?(list: @list, user: user)
  render json: { exists: guest_exists, valid_user: !user.nil? }
  end

  private

  def list_guest_params
    params.require(:list_guest).permit(:list_id, :user_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
