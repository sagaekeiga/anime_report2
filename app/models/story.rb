class Story < ActiveRecord::Base
    validates :url, uniqueness: true, presence: true
    validates :s_title, presence: true
    validates :matching, presence: true
end
