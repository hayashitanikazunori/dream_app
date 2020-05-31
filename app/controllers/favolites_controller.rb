class FavolitesController < ApplicationController
  def create
    @favolite = current_user.favolites.create(post_id: params[:post_id])
    redirect_back(fallback_location: '/posts')
  end

  def destroy
    @favolite = Favolite.find_by(post_id: params[:post_id], user_id: current_user.id)
    @favolite.destroy
    redirect_back(fallback_location: '/posts')
  end
end
