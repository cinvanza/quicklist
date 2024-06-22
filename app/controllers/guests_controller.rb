class GuestsController < ApplicationController

  def search
    @guests = Guest.all
    if params[:].present?
      @guests= @guests(address: params[:first_name
        ])
  end
end
