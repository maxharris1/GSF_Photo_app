class PagesController < ApplicationController

  def index
    @photos = Photo.all
    @tagged_photos = Photo.tagged_with(params[:search]).order("created_at DESC")



  end



end
