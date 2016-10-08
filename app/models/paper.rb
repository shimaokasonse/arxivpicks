class Paper < ActiveRecord::Base
  has_many :comments
  has_many :publishs

  def authors
    result = []
    Publish.where(paper_id: self.id).each do |publish|
      result << Author.find(publish.author_id).name
    end
    return result
  end

  def has_comment_from?(user_id)
    if Comment.find_by(paper_id: self.id, user_id: user_id) 
      return true
    end
    return false
  end

  def get_comment_from_user(user_id)
    Comment.find_by(paper_id: self.id, user_id: user_id)
  end

end
