class CheckList < ActiveRecord::Base
  validates :name, :presence => true
  
  has_many :check_items
  belongs_to :unit

end
