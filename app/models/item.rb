class Item < ActiveRecord::Base
  acts_as_list

  #attr_accessible :content, :kind, :page_title, :category_id
  validates_presence_of :category_id
  belongs_to :category

  def destroy
    self.is_deletable? ? super : return
  end
end
