class Result < ActiveRecord::Base
  validates :check_item_id, :presence => true
  validates :severity, :presence => true
  validates_inclusion_of :severity, :in => 0..5
  validates_inclusion_of :severity, :in => 1..5, :if => :comment?
  

  #belongs_to :unit, :check_item

  before_validation :set_default_severity
  
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

# create_table "results", :force => true do |t|
#   t.integer  "severity"
#   t.string   "comment"
#   t.integer  "unit_id"
#   t.integer  "check_item_id"
#   t.datetime "created_at",    :null => false
#   t.datetime "updated_at",    :null => false
# end
