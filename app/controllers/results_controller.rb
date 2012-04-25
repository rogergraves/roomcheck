class ResultsController < ApplicationController
  def index
    
    @order = params[:ord] == 'desc' ? 'asc' : 'desc'

    if(params[:sort_by] == 'room')
      @results = Result.by_room(params[:ord]).where('severity > 0').find_all_by_completed_on(nil)
    elsif(params[:sort_by] == 'area')
      @results = Result.by_area(params[:ord]).where('severity > 0').find_all_by_completed_on(nil)
    elsif(params[:sort_by] == 'check_item')
      @results = Result.by_check_item(params[:ord]).where('severity > 0').find_all_by_completed_on(nil)
    elsif(params[:sort_by] == 'comment')
      @results = Result.by_comment(params[:ord]).where('severity > 0').find_all_by_completed_on(nil)
    else
      @results = Result.by_severity(params[:ord]).where('severity > 0').find_all_by_completed_on(nil)
    end
    
  end
  
  def new
    @checkitem = CheckItem.find_by_id(params[:check_item_id])
    @result = Result.new
    @result.check_item_id = params[:check_item_id]
  end

  def create
    if(params[:markasok])
      checked_as_ok = 0

      check_items = CheckItem.find_all_by_check_list_id(params[:check_list_id])
      
      check_items.each do |check_item|
        exists = Result.find_by_check_item_id_and_completed_on(check_item.id, nil)
        unless exists
          result = Result.new(severity: 0, check_item_id: check_item.id)
          result.save
          checked_as_ok += 1
        end
      end

      redirect_to(check_list_path(params[:check_list_id]), :notice => "#{checked_as_ok} items checked as OK")
    else    
      @result = Result.new(params[:result])
      if @result.save
        redirect_to(check_list_path(@result.check_item.check_list_id)+"#check_item_#{@result.check_item_id}", :notice => "Saved")
      else
        errormessages = ""
        @result.errors.full_messages.each do |e|
          errormessages += ", " if errormessages.length > 0 
          errormessages += e
        end
        flash[:error] = "Errors occurred: #{errormessages}"
        redirect_to(check_lists_path)
      end   
    end
  end

  def edit    
    @result = Result.find_by_id(params[:id])
  end

  def update
    @result = Result.find(params[:id])
    if @result.update_attributes(params[:result])
      redirect_to(check_list_path(@result.check_item.check_list_id)+"#check_item_#{@result.check_item_id}", :notice => "Saved")
    else
      errormessages = ""
      @result.errors.full_messages.each do |e|
        errormessages += ", " if errormessages.length > 0
        errormessages += e
      end
      flash[:error] = "Errors occurred: #{errormessages}"
      redirect_to(edit_result_path(@result.id))
    end
  end

  # CHECKCHECK look at destroy method - does it destroy?
  def destroy
     @result = Result.find_by_id(params[:id])
     @result.completed_on = Time.now
     @result.remove_image!
     @result.save
     
     redirect_to(check_list_path(@result.check_item.check_list_id)+"#check_item_#{@result.check_item_id}", :notice => "Problem solved")
  end

  def show
  end
end

