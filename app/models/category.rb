class Category < ActiveRecord::Base
  has_many :issues




  def allissuescategories(category_id)
    qq=Issue.where(:category_id => category_id)
    return qq
  end





end
