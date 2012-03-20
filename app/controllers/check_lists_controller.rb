class CheckListsController < ApplicationController
  def index
   @checklists = CheckList.all
  end
  
  def show
   @check_list = CheckList.find(params[:id])
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
