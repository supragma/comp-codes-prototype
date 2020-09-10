class User < ApplicationRecord
  has_many :posts
  has_many :comments, class_name: 'Comments', foreign_key: 'comment_id'
end
