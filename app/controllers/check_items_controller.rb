class CheckItemsController < ApplicationController
  def new
    @check_item = CheckItem.new
    @check_item.check_list_id = params[:check_list_id]
    #@check_list = CheckList
    # @check_list = CheckList.find_by_id(params[:check_list_id])
  end
  
  def create
    #@check_item = CheckItem.new(params[:check_item])
    # list = CheckList.find_by_id(params[:check_list_id])
    # check_item = list.check_items.build(params[:check_item])

    
    @check_item = CheckItem.new(params[:check_item])
    @check_item.save ? redirect_to(check_lists_path, :notice => "Item Saved") : flash[:error]

  end

  def edit
  end

  def destroy
  end
end
