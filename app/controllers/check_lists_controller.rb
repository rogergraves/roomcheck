class CheckListsController < ApplicationController
  def index
    @checklists = CheckList.all
  end
  
  def show
    @checklist = CheckList.find(params[:id])
    @checkitems = CheckItem.find_all_by_check_list_id(params[:id])
    logger.info "DEBUG:::::#{@checklists.inspect}"
  end

  def new
  end

  def edit
  end

  def destroy
  end
end
