class Unit < ActiveRecord::Base
  validates :name, :presence => true
  
  has_many :results  
  has_many :check_lists
  
  after_save do
    a = self.check_lists.build
    a.name = 'my first checklist'
    a.save
  end
end
