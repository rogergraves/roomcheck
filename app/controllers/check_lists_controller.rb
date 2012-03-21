class CheckListsController < ApplicationController
  def index
    @checklists = CheckList.all
  end
  
  def show
    @checklist = CheckList.find(params[:id])
    @checkitems = CheckItem.find_all_by_check_list_id(params[:id], :order => "item_order asc, id asc")
    
    i = 1
    @checkitems.each do |checkitem|
      checkitem.item_order = i
      i += 1
      checkitem.save
    end
    
    logger.info "DEBUG:::::#{@checklists.inspect}"
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
end
