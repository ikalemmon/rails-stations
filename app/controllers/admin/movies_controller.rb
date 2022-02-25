class Admin::MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end
    # GET /admin/movies/new
    def new
        @movies = Movie.new
    end
    # POST /admin/movies
    def create
        @movies = Movie.create(movie_params)
            if @movies.valid?
              redirect_to admin_movies_path
            else
                flash[:alert] = "全て入力してください"
                redirect_to admin_movies_new_path
            end
        
    end
    private 
    def movie_params
        params.require(:movie).permit(:name,:year,:is_showing,:description,:image_url)
    end
end
