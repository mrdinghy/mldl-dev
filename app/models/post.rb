class Post < ActiveRecord::Base

  translates :title, :description

  has_many :site_documents
  has_many :site_images



  acts_as_commentable
  has_many :comments
end
