class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :content, :presence => true
  
  belongs_to :board, :counter_cache => true
  belongs_to :user
  
  has_many :comments, :dependent => :destroy

  has_attached_file :cool_image, :styles => { :medium => "600x600>", :thumb => "100x100>"}
end
