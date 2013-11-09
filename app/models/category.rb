class Category < ActiveRecord::Base
  attr_accessible :is_visible, :name
  has_many :items, dependent: :restrict
end
