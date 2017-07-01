class Anime < ActiveRecord::Base
    validates :title, uniqueness: true
end
