class MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end

    def search
        @search_params = movie_search_params
        if @search_params.blank? then 
          @movies = Movie.all
        else
          @movies = Movie.search(@search_params)
        end
        render "index"
    end

    def movie_search_params
        params.fetch(:search, {}).permit(:keyword, :is_showing)
    end
end
