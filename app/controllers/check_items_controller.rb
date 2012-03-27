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
    if @check_item.save 
      redirect_to(check_list_path(@check_item.check_list_id), :notice => "Item Saved") 
      
      if(params[:add_all_rooms])
        checklists = CheckList.all
        checklists.each do |checklist|
          unless checklist.id == @check_item.check_list.id
            CheckItem.create({
              name: @check_item.name,
              area: @check_item.area,
              check_list_id: checklist.id,
            })
          end
        end
        CheckItemTemplate.create({
          name: @check_item.name,
          area: @check_item.area,
        })
      end    
      
      
      
    else
      flash[:error]
    end
    
  end

  def edit
    @check_item = CheckItem.find(params[:id])
  end
  
  def update
    @check_item = CheckItem.find(params[:id])
    @check_item.update_attributes(params[:check_item]) ? redirect_to(check_list_path(@check_item.check_list_id), :notice => "Item Saved") : flash[:error]
  end

  def destroy
    @check_item = CheckItem.find(params[:id])
    @check_item.destroy ? redirect_to(check_list_path(check_list_id), :notice => "Item Deleted") : flash[:error]
  end
end




# i = 1
# @checkitems.each do |checkitem|
#   checkitem.item_order = i
#   i += 1
#   checkitem.save