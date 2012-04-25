class Result < ActiveRecord::Base
  attr_accessible :comment, :severity, :check_item_id, :image
  mount_uploader :image, ImageUploader
  
  validates :check_item_id, :presence => true
  validates :severity, :presence => true
  validates_inclusion_of :severity, :in => 0..5
  validates_inclusion_of :severity, :in => 1..5, :if => :comment?
  validates_uniqueness_of :check_item_id, :scope => [:check_item_id, :completed_on]
  
  belongs_to :check_item
  has_one :check_list, :through => :check_item
  
  before_validation :set_empty_comments_to_nill, :set_default_severity
  
  scope :by_severity, :order => "severity DESC"
  scope :first_not_done, :conditions => "completed_on = NIL"
  
  scope :by_severity, lambda { |ord| {:order => "severity #{ord}"}}
  scope :by_comment, lambda { |ord| {:order => "LOWER(results.comment) #{ord}"}}
  scope :by_room, lambda { |ord| joins(:check_list).order("LOWER(check_lists.name) #{ord}") }
  scope :by_area, lambda {|ord| joins(:check_item).order("LOWER(check_items.area) #{ord}") }
  scope :by_check_item, lambda {|ord| joins(:check_item).order("LOWER(check_items.name) #{ord}") }
  
  def set_empty_comments_to_nill
    self.comment = nil if self.comment.blank?
  end
  
  def set_default_severity
    
    # If a comment does not exist and severity does not exist, severity should be set to 0 (OK)
    if comment.nil? && severity.nil?
      self.severity = 0
    end

    # If a comment exists and severity is 0 or nil, set severity to 1
    unless comment.nil?
      if severity.nil? || severity == 0
        self.severity = 1
      end
    end
  end
  
end


# create_table "check_lists", :force => true do |t|
#   t.string   "name"
#   t.datetime "created_at", :null => false
#   t.datetime "updated_at", :null => false
# end
#
# create_table "check_items", :force => true do |t|
#   t.string   "name"
#   t.string   "area"
#   t.datetime "created_at",    :null => false
#   t.datetime "updated_at",    :null => false
#   t.integer  "check_list_id"
#   t.integer  "item_order"
# end
# 
# create_table "results", :force => true do |t|
#   t.integer  "severity"
#   t.string   "comment"
#   t.integer  "check_item_id"
#   t.datetime "created_at",    :null => false
#   t.datetime "updated_at",    :null => false
#   t.datetime "completed_on"
# end
