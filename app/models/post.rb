class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination
    after_initialize :init

    validates :title, presence: true
    validates :content, length: {minimum: 100, too_short: "%{count} characters is the minimum allowed"}

    def init
        if self.likes.nil? 
            self.likes = 0
        end
    end
end
