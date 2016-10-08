class Paper < ActiveRecord::Base
  has_many :comments
  has_many :publish
end
