class Favtags::TagfavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favtags


  def create
    @favtags.tagfavorites.where(user_id: current_user.id, favtag_id: @favtags.id).first_or_create

    respond_to do |format|
      format.html { redirect_to @favtags }
      format.js
    end
  end

  def destroy
    @favtags.tagfavorites.where(user_id: current_user.id, favtag_id: @favtags.id).destroy_all

    respond_to do |format|
      format.html { redirect_to @favtags }
      format.js
    end


  end

  private

  def set_favtags
    @favtags = Favtag.find(params[:favtag_id])

  end
end