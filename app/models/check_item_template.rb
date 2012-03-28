class CheckItemTemplate < ActiveRecord::Base
  validates :name, :presence => true
  
  scope :by_name, :order => "LOWER(name) ASC"
  scope :by_item_order, :order => "item_order ASC, id ASC"
end
