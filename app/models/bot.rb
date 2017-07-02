class Bot < ActiveRecord::Base
    validates :name, uniqueness: true, presence: true
    validates :url, uniqueness: true, presence: true
end
