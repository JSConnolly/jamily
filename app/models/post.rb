class Post < ActiveRecord::Base
  has_many :posts_tags
  has_many :tags, through: :posts_tags
end
