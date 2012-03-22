class CheckListsController < ApplicationController
  def index
    @checklists = CheckList.all
  end
  
  def show
    @checklist = CheckList.find(params[:id])

    @checklists = CheckList.by_name.select { |check_list| check_list.check_items.count > 0 }
    @checkitems = CheckItem.by_item_order.find_all_by_check_list_id(params[:id])
    @checkitemtemplatescount = CheckItemTemplate.count

  end

  def new
    @check_list = CheckList.new
  end

  def edit
  end

  def destroy
    check_list = CheckList.find_by_id(params[:check_list_id])
    logger.info "CheckListsController#destroy: #{params[:check_list_id]}"
    check_list.destroy ? redirect_to(check_lists_path, :notice => "#{check_list.name} Deleted") : flash[:error]

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
  end


  def clone
    checks_from_clone = CheckItem.find_all_by_check_list_id(params[:clone_check_list_id])
    checks_from_clone.each do |check_item|
      CheckItem.create({
        name: check_item.name,
        area: check_item.area,
        check_list_id: params[:check_list_id],
        item_order: check_item.item_order,
      })
    end
    
    redirect_to(check_list_path(params[:check_list_id]))
  end
end
