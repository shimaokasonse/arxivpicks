class Comment < ActiveRecord::Base
  belongs_to  :user
  belongs_to :paper
  has_many :likes
end
