class Board < ActiveRecord::Base
  validates :name, :presence => true
  
  has_many :posts
  has_many :comments
end
