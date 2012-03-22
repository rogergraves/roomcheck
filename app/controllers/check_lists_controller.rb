class CheckListsController < ApplicationController
  def index
    @checklists = CheckList.all
  end
  
  def show
    @checklist = CheckList.find(params[:id])
    @checkitems = CheckItem.find_all_by_check_list_id(params[:id])
  end

  def new
    @check_list = CheckList.new
  end

  def edit
  end

  def destroy
  end
  
  def create
    @check_list = CheckList.new(params[:check_list])
    if @check_list.save
      redirect_to(check_list_path(@check_list.id), :notice => "List Saved")
    else
      flash[:error]
    end
  end
  
  def update
    order = params[:order]
    new_order = order.split("X")
    
    order_hash = {}
    i = 1
    new_order.each do |check_item_id|
      order_hash[check_item_id] = i
      i += 1
    end
    
    checkitems = CheckItem.find_all_by_check_list_id(CheckItem.find_by_id(order_hash.keys[0]).check_list_id)
    checkitems.each do |check_item|
      check_item.item_order = order_hash[check_item.id.to_s]
      check_item.save
    end
    logger.info "DEBUG:::::#{checkitems.inspect}"
    
    logger.info "DEBUGGGGGG!!!!!: #{new_order}"
    # @checkitem = CheckItem.find_by_order(params[:checklist][order])
    # @checkitem.order = 
    # respond_to do |format|
    #    format.js 
    #  end
  end
end
