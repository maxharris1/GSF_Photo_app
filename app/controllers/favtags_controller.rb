class FavtagsController < ApplicationController
  before_action :set_favtags, only: [:edit, :update, :show, :destroy]










  def new
    #@tagfavs = @articles.object.tag_list
    @favtags = Favtag.new
  end

  def show
    @favtags = Favtag.all


  end

  def edit

  end

  def index
    @favtags = Favtag.all
  end

  def set_favtags
    @favtags = Favtag.find(params[:id])
  end

  def destroy
    @favtags.destroy
    flash[:notice] = "Favtag was deleted"
    redirect_to root_path
  end

  def update
    if @favtags.update(favtags_params)
      flash[:notice] = "favtag was updated"
      redirect_to root_path
    else
      flash[:alert] = "favtag was not updated"
      render 'edit'
    end
  end

  def create
    #render plain: params[:article].inspect
    @favtags = Favtag.new(favtags_params)
    @favtags.save
    if @favtags.save
      flash[:notice] = "favtag was successfully created"
      redirect_to root_path
    else
      flash[:alert] = "ERROR: Could not create favtag"
      render 'new'
    end

  end





  private
  def favtags_params
    params.require(:favtag).permit(:name)
  end
end