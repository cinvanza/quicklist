class ListGuestsController < ApplicationController
  def new
    @list_guest = ListGuest.new
  end

  def create
    user = User.find_by(email: params[:email])

    if user
      @list_guest = ListGuest.new(list_guest_params)
      @list_guest.user = user

      if @list_guest.save
        redirect_to some_path, notice: 'Guest was successfully created.'
      else
        render :new
      end
    else
      flash[:alert] = 'User not found'
      render :new
    end
  end

  private

  def list_guest_params
    params.require(:list_guest).permit(:list_id, :user_id)
  end
end
