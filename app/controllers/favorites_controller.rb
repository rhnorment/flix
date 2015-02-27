class FavoritesController < ApplicationController

  before_action   :require_signin
  before_action   :set_movie

  def create
    @favorite = @movie.favorites.create!(user: current_user)
    redirect_to @movie, notice: 'Thanks for favoriting!'
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])
    favorite.destroy
    redirect_to @movie, notice: "Sorry you unfaved it!"
  end

  private

    def set_movie
      @movie = Movie.find_by!(slug: params[:movie_id])
    end

end
