class Admin::MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end
    # GET /admin/movies/new
    def new
        @movie = Movie.new
    end
    # POST /admin/movies
    def create
        @movie = Movie.create(movie_params)
            if @movie.valid?
              redirect_to admin_movies_path
            else
                flash[:alert] = "全て入力してください"
                redirect_to admin_movies_new_path
            end
        
    end
    

    #station4
    def edit
        if Movie.find_by(id: params[:id]) == nil
            redirect_to "/admin/movies"
        else
            @movie = Movie.find(params[:id])
        end
    end
    
    def update
        if Movie.find_by(id: params[:id]) == nil
            redirect_to "/admin/movies"
        else
            @movie = Movie.find(params[:id])
            
            if @movie.update(movie_params)
                flash.now[:alert] = '編集しました'
                redirect_to admin_movies_path
            else
                flash[:alert] = 'ちゃんと編集してください！！'
                redirect_to admin_movies_edit_path#action: :edit,id:@movie.id
            end
        end  
    end
    private 
    def movie_params
        params.require(:movie).permit(:name,:year,:is_showing,:description,:image_url)
    end

end
