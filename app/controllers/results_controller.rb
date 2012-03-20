

class ResultsController < ApplicationController
  def new
    logger.info "ResultsController.new called!!!!!"
    @result = Result.new
    @result.check_item_id = params[:check_item_id]
    
    # logger.info "ResultsController.new called!!!!!"
    # @result = Result.find_by_check_item_id(params[:check_item_id])
    # @result.check_item_id = params[:check_item_id]
    # @result.unit_id = params[:unit_id]
    # @result = Result.new if @result.nil?
    # # Look for result_id that has check_item_id = @result.check_item_id && unit_id == @result.unit_id
    # @result = Result.new if @result.nil?
  end

  def create
    @result = Result.new(params[:result])
    if @result.save
      redirect_to(check_lists_path, :notice => "Saved")
    else
      errormessages = ""
      @result.errors.full_messages.each do |e|
        errormessages += ", " if errormessages.length > 0 
        errormessages += e
      end
      redirect_to(check_lists_path, :notice => "Errors occurred: #{errormessages}")
    end   
  end

  def edit    
    @result = Result.find_by_id(params[:id])
  end

  def update
    @result = Result.find(params[:id])
    if @result.update_attributes(params[:result])
      redirect_to(check_lists_path, :notice => "Saved")
    else
      errormessages = ""
      @result.errors.full_messages.each do |e|
        errormessages += ", " if errormessages.length > 0 
        errormessages += e
      end
      redirect_to(check_lists_path, :notice => "Errors occurred: #{errormessages}")
    end
  end

  def destroy
  end

  def show
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