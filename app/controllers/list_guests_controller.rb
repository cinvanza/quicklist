class ListGuestsController < ApplicationController
  def create
    @user = User.find_by(email: "user@example.com")

    if @user
      @list_guest = ListGuest.create(user_id: @user.id, email: @user.email)

      if @list_guest.persisted?
        render json: { message: 'Guest successfully added to the list' }, status: :created
      else
        render json: { errors: @list_guest.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'User not found. Please enter another email.' }, status: :not_found
    end
  end
end
