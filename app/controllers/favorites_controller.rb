class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_back(fallback_location: '/posts')
  end

  def destroy
    @favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
    @favorite.destroy
    redirect_back(fallback_location: '/posts')
  end
end
