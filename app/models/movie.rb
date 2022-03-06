class Movie < ApplicationRecord
    validates :name, presence: true,uniqueness:true
    validates :year, presence: true, length:{is:4},format:{with:/\A[0-9]+\z/}
    validates :description, presence: true
    validates :image_url, presence: true, format:/\A#{URI::regexp(%w(http https))}\z/

    def self.search(search_params)
        #@selected_movies=where(["name like? OR description like?", "%#{keyword}%", "%#{keyword}%"])
        @movies = Movie.where( 'is_showing like ?', "%#{search_params[:is_showing]}%" )
        @movies.where('name like ?',"%#{ search_params[:keyword] }%").or(@movies.where('description like ?', "%#{ search_params[:keyword] }%"))
    end
end
