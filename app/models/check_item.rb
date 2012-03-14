class CheckItem < ActiveRecord::Base
  validates :name, :presence => true
end
