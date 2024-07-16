class ListGuestsController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @list_guest = ListGuest.new
  end

  def create
    @list = List.find(params[:list_id])
    success_count = 0
    failure_count = 0
    already_exists_count = 0

    params[:user_ids].each do |user_id|
      next if user_id.blank?

      user = User.find_by(id: user_id)

      if user
        @list_guest = ListGuest.new(user: user, list_id: params[:list_id])

        if @list_guest.save
          success_count += 1
        else
          failure_count += 1
        end
      else

        failure_count += 1
      end
    end

    redirect_to list_path(params[:list_id])
  end

  def destroy
    @list_guest = ListGuest.find(params[:id])
    @list = @list_guest.list
    @list_guest.destroy

  end

  private

  def list_guest_params
    params.require(:list_guest).permit(:list_id, :user_id)
  end
end
