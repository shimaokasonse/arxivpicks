class Comment < ActiveRecord::Base
  belongs_to  :user
  belongs_to :paper
  has_many :likes

  def like_count
    likes.count
  end

  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end
  
end
