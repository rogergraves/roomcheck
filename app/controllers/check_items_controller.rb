class CheckItemsController < ApplicationController
  def new
    @check_item = CheckItem.new
  end
  
  def create
    @check_item = CheckItem.new(params[:check_item])
    redirect_to(root_path, :notice => "Saved") if @check_item.save
  end

  def edit
  end

  def destroy
  end
end
