class CheckList < ActiveRecord::Base
  validates :name, :presence => true
  has_many :check_items, :dependent => :destroy


  scope :by_name, :order => "LOWER(name) ASC"
  # attr_reader :add_template_items
  # def add_template_items=(value)
  #  # @add_template_items = value
  #   if value == "Yes"
  #     CheckItem.all.each do |check_item|
  #       if check_item.template_item == true
  #        
  #        self.check_items << check_item
  #       end
  #     end
  #   end
  # end
end
