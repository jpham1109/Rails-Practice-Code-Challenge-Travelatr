class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: { only_integer: true, :greater_than => 0}
    validates :bio, length: { minimum: 30, too_short: "%{count} characters is the minimum allowed" }
  
    def total_likes
        self.posts.sum{|post| post.likes}
    end

    def featured_post
        self.posts.max_by {|post| post.likes}
    end

    def favorite_destinations
        destinations = self.posts.group_by{|post| post.destination}
        sorted_destinations = destinations.sort_by{|dest, post| posts.length}.reverse
        sorted_destinations.map {|dest| dest[0]}[0..4]
    end
end
