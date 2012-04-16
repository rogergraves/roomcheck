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
    if(params[:results])
      check_list_params = params[:check_list_id]
      check_list_id = check_list_params.first[0]
      
      check_item_ids = params[:results]
      check_item_ids.each do |check_item_id, junk|
        exists = Result.find_by_check_item_id_and_completed_on(check_item_id, nil)
        if exists
          exists.updated_at = Time.now
          exists.save
        else
          result = Result.new(severity: 0, check_item_id: check_item_id)
          result.save
        end
      end
      
      redirect_to(check_list_path(check_list_id))
      
    else    
      @result = Result.new(params[:result])
      if @result.save
        redirect_to(check_list_path(@result.check_item.check_list_id), :notice => "Saved")
      else
        errormessages = ""
        @result.errors.full_messages.each do |e|
          errormessages += ", " if errormessages.length > 0 
          errormessages += e
        end
        redirect_to(check_lists_path, :notice => "Errors occurred: #{errormessages}")
      end   
    end
  end

  def edit    
    @result = Result.find_by_id(params[:id])
  end

  def update
    if(params[:markasok])
      logger.info "\n\nMARK AS OK HERE!!!\n\n"
      checked_as_ok = 0
      redirect_to(check_list_path(params[:check_list_id]), :notice => "#{checked_as_ok} items checked as OK")
    else
      @result = Result.find(params[:id])
      if @result.update_attributes(params[:result])
        redirect_to(check_list_path(@result.check_item.check_list_id), :notice => "Saved")
      else
        errormessages = ""
        @result.errors.full_messages.each do |e|
          errormessages += ", " if errormessages.length > 0
          errormessages += e
        end
        redirect_to(check_lists_path, :notice => "Errors occurred: #{errormessages}")
      end
    end
  end
# CHECKCHECK look at destroy method - does it destroy?
  def destroy
     @result = Result.find_by_id(params[:id])
     @result.completed_on = Time.now
     @result.save
     
     redirect_to(check_list_path(@result.check_item.check_list_id), :notice => "Problem solved")
  end

  def show
  end
end

