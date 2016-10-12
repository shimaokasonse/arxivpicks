class Paper < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :publishs, :dependent => :destroy

  mount_uploader :image, ImageUploader

  def authors
    result = []
    Publish.where(paper_id: self.id).each do |publish|
      result << Author.find(publish.author_id).name
    end
    return result
  end

  def comment_user(user_id)
    comments.find_by(user_id: user_id)
  end

  def top_comment
    max_likes = comments.maximum(:likes_count)
      comments.find_by(likes_count: max_likes)
  end

end
