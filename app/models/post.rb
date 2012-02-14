class Post < ActiveRecord::Base
  belongs_to :board, :counter_cache => true
  belongs_to :user
  
  has_many :comments
  
  scope :recent, :order => 'updated_at DESC'
  has_attached_file :cool_image, :styles => { :medium => "300x300>", :thumb => "100x100>"}
end
