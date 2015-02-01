module ReviewsHelper

  def format_average_stars(movie)
    movie.average_stars.nil? ? 'No reviews' : pluralize(number_with_precision(movie.average_stars, precision: 1), 'star')
  end


end
