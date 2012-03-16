class Unit < ActiveRecord::Base
  validates :name, :presence => true
  
  has_many :results  
  has_many :check_lists
end
