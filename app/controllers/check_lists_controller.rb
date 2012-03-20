class CheckListsController < ApplicationController
  def index
    @checklists = CheckList.all
  end
  
  def show
   @checklists = CheckList.all
  end

  def new
  end

  def edit
  end

  def destroy
  end
end
