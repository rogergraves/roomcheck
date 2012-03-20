class CheckList < ActiveRecord::Base
  validates :name, :presence => true
  has_many :check_items
  
  before_validation :add_template_items
  
  def add_template_items
    CheckItem.all.each do |check_item|
      if check_item.template_item == true
        self.check_items << check_item
      end
    end
  end

end
