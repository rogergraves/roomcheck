class CheckList < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  has_many :check_items, :dependent => :destroy
  has_many :results, :through => :check_items

  scope :by_name, :order => "LOWER(name) ASC"
end
