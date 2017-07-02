class Channel < ActiveRecord::Base
    validates :title, presence: true
    validates :url, uniqueness: true, presence: true
end