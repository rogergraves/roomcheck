class CheckItem < ActiveRecord::Base
  validates :name, :presence => true
  
  belongs_to :check_list
  has_many :results, :dependent => :destroy
  
  scope :by_item_order, :order => "item_order ASC, id ASC"
  
  before_create :add_item_order
  
  
  def add_item_order
      item_order_numbers = []
      check_items = CheckList.find_by_id(self.check_list_id).check_items
      if check_items.length == 0
        self.item_order = 1
      else
        check_items.each do |item| 
          item_order_numbers << item.item_order
          max_number = item_order_numbers.sort[-1]
          self.item_order = max_number + 1
        end
      end
    end
end



# validates :name, :uniqueness => { :scope => :area }
# 
# validates_each :name do |record, attr, value|
#   check_items = self.all(:conditions => ["lower(area) = lower(?)", record.area])
#   names = check_items.collect { |n| n.name.to_s.downcase }
#   if names.include?(value.to_s.downcase)
#     record.errors.add(attr, 'already exists for area')
#   end
# end