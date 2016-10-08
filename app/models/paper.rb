class Paper < ActiveRecord::Base
  has_many :comments
  has_many :publishs
end
