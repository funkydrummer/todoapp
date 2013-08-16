class Song < ActiveRecord::Base
  default_scope order('created_at DESC')
  attr_accessible :content, :kind, :page_title, :category_id
  validates_presence_of :category_id
  belongs_to :category
end
