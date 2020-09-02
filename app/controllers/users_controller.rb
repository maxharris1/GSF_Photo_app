class UsersController < ApplicationController

  def profile
    @photos = Photo.all
    if current_user
      @myphotos = @photos.where(user_id: current_user.id)
    end
  end



end