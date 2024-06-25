class ListGuestsController < ApplicationController
  def new
    @list_guest = ListGuest.new
  end


  def create

    user = User.find_by(email: params[:email])

    if user
      @list_guest = ListGuest.new
      @list_guest.user = user
      @list_guest.list_id = params[:list_id]

      if @list_guest.save
        redirect_to list_path(params[:list_id]) , notice: 'Guest was successfully created.'
      else
        redirect_to list_path(params[:list_id]), notice: 'User not found'
      end
    else
      flash[:alert] = 'User not found'
      redirect_to list_path(params[:list_id])

    end
  end

  private

  def list_guest_params
    params.require(:list_guest).permit(:list_id, :user_id)
  end
end
