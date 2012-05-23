class CheckItemTemplatesController < ApplicationController
  before_filter :authenticate_user!

  # GET /check_item_templates
  # GET /check_item_templates.json
  def index
    @check_item_templates = CheckItemTemplate.by_item_template_order.all
    @checklists = CheckList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @check_item_templates }
    end
  end

  # GET /check_item_templates/1
  # GET /check_item_templates/1.json
  def show
    @check_item_template = CheckItemTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @check_item_template }
    end
  end

  # GET /check_item_templates/new
  # GET /check_item_templates/new.json
  def new
    @check_item_template = CheckItemTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @check_item_template }
    end
  end

  # GET /check_item_templates/1/edit
  def edit
    @check_item_template = CheckItemTemplate.find(params[:id])
  end

  # POST /check_item_templates
  # POST /check_item_templates.json
  def create
    @check_item_template = CheckItemTemplate.new(params[:check_item_template])

    respond_to do |format|
      if @check_item_template.save
        format.html { redirect_to check_item_templates_path, notice: 'Check item template was successfully created.' }
        format.json { render json: @check_item_template, status: :created, location: @check_item_template }
      else
        format.html { render action: "new" }
        format.json { render json: @check_item_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /check_item_templates/1
  # PUT /check_item_templates/1.json
  
  def reorder
    new_order = params[:check_item_template].map {|e1, e2| [e1.to_i, e2.to_f]}.sort_by { |check_item_id, order| order }
    
    logger.info "\n\n!!!!!!!!!!!!!!!!!!\nCheckItemTemplatesController#reorder\n#{new_order.to_s}\n!!!!!!!!!!!!!!!!!!\n\n"
    
    order_hash = {}
    i = 1
    new_order.each do |check_item_template_id|
      order_hash[check_item_template_id[0].to_s] = i
      i += 1
    end
    
    checkitemstemplates = CheckItemTemplate.all
    checkitemstemplates.each do |check_item_template|
      check_item_template.item_order = order_hash[check_item_template.id.to_s]
      check_item_template.save
    end
    
    flash[:notice] = "Check items reordered"
    redirect_to check_item_templates_path
    
  end
  
  def update
    @check_item_template = CheckItemTemplate.find(params[:id])
    @check_item_template.update_attributes(params[:check_item_template]) ? redirect_to(check_item_templates_path, :notice => "Item Saved") : flash[:error]
  end
   

  # DELETE /check_item_templates/1
  # DELETE /check_item_templates/1.json
  def destroy
    @check_item_template = CheckItemTemplate.find(params[:id])
    @check_item_template.destroy

    respond_to do |format|
      format.html { redirect_to check_item_templates_url }
      format.json { head :no_content }
    end
  end
  
  def clone
    logger.info "\n\n!!!!!!!!!!!!!!!\nCheckItemTemplatesController#clone CALLED: #{params[:check_list_id]}\n!!!!!!!!!!!!!!!\n"
    if params[:check_list_id]
      @templates = CheckItemTemplate.all
      @templates.each do |template|
        item = CheckItem.new(name: template.name, area: template.area, item_order: template.item_order, check_list_id: params[:check_list_id])
        item.save if item.valid?
      end
    end
    redirect_to check_list_path(params[:check_list_id])
  end
  
  def reverseclone
    logger.info "\n\n!!!!!!!!!!!!!!!\\n#{params.inspect}\n!!!!!!!!!!!!!!!\n\n"
    CheckItemTemplate.destroy_all
    @check_list = CheckList.find(params[:clone_check_list_id])
    @check_items = CheckItem.find_all_by_check_list_id(@check_list.id, :order => 'item_order')
    
    @check_items.each do |check_item|
      check_item_template = CheckItemTemplate.new(name: check_item.name, area: check_item.area, item_order: check_item.item_order)
      check_item_template.save
    end
  
    flash[:notice] = "Check items cloned from room #{@check_list.name}"
    redirect_to check_item_templates_path
  end
  
end
