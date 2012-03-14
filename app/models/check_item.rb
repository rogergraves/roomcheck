class CheckItem < ActiveRecord::Base
  validates :name, :presence => true
  validates :name, :uniqueness => { :scope => :area }

  validates_each :name do |record, attr, value|
    check_items = self.all(:conditions => ["lower(area) = lower(?)", record.area])
    names = check_items.collect { |n| n.name.to_s.downcase }
    if names.include?(value.to_s.downcase)
      record.errors.add(attr, 'already exists for area')
    end
  end
end
