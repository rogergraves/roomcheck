class ResultsController < ApplicationController
  def new
    logger.info "ResultsController.new called!!!!!"
    @result = Result.new
    #@resuls.check_item_id = params[:check_item_id]
  end

  def create
    @result = Result.new(params[:result])
    redirect_to(new_result_path, :notice => "Saved") if @result.save
  end

  def edit
  end

  def update
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