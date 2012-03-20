class CheckList < ActiveRecord::Base
  validates :name, :presence => true
  validates :unit_id, :presence => true
  has_many :check_items
  belongs_to :unit
  
  before_validation :add_template_items
  
  def add_template_items
    CheckItem.all.each do |check_item|
      if check_item.template_item == true
        self.check_items << check_item
      end
    end
  end

end
