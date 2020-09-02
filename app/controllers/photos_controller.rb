class PhotosController < ApplicationController

  before_action :set_photos, only: [:edit, :update, :show, :destroy]










  def new
    #@tagfavs = @articles.object.tag_list
    @photos = Photo.new
  end

  def show
    @photos = Photo.all
    @recent = Photo.order('created_at DESC').limit(7)


    if current_user
      @myphotos = @photos.where(user_id: current_user.id)
    end


  end

  def edit

  end

  def index
    @photos = Photo.all
  end

  def set_photos
    @photos = Photo.find(params[:id])
  end

  def destroy
    @photos.destroy
    flash[:notice] = "Photo was deleted"
    redirect_to root_path
  end

  def update
    if @photos.update(photos_params)
      flash[:notice] = "Photo was updated"
      redirect_to root_path
    else
      flash[:alert] = "Photo was not updated"
      render 'edit'
    end
  end

  def create
    #render plain: params[:article].inspect
    @photos = Photo.new(photos_params)
    @photos.save
    if @photos.save
      flash[:notice] = "Photo was successfully created"
      redirect_to root_path
    else
      flash[:alert] = "ERROR: Could not create Photo"
      render 'new'
    end

  end


  private
  def photos_params
    params.require(:photo).permit(:caption, :thumbnail, :user_id, :tag_list)
  end


end