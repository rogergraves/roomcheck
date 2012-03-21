class CheckList < ActiveRecord::Base
  validates :name, :presence => true
  has_many :check_items

end

# def downorder
#    logger.info "DEBUG:::::: CheckItemsController#downorder CALLED!!!!!"
#  end
# 
#  def uporder
#    logger.info "DEBUG:::::: CheckItemsController#uporder CALLED!!!!!"
#  end