class Public::FavoritesController < ApplicationController
  
  def create
    nyankogram = Nyakogram.find(params[:nyankogram_id])
    favorite = current_user.favorites.new(nyankogram_id: nyankogram.id)
    favorite.save
    redirect_to nyankogram_path(nyankogram)
  end

  def destroy
    nyankogram = Nyankogram.find(params[:nyankogram_id])
    favorite = current_user.favorites.find_by(nyankogram_id: nyankogram.id)
    favorite.destroy
    redirect_to nyankogram_path(nyankogram)
  end
end
