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

end
