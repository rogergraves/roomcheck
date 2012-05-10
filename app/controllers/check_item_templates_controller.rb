class CheckItemTemplatesController < ApplicationController
  before_filter :authenticate_user!

  # GET /check_item_templates
  # GET /check_item_templates.json
  def index
    @check_item_templates = CheckItemTemplate.by_item_template_order.all

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
  
    order = params[:order]
    new_order = order.split("X")
       
       order_hash = {}
       i = 1
       new_order.each do |template_id|
         order_hash[template_id] = i
         i += 1
       end
       CheckItemTemplate.all.each do |template_item|
         template_item.item_order = order_hash[template_item.id.to_s]
         puts "********************* #{template_item.inspect}"
         template_item.save
       end  
    
  end
  
  def update
    @check_item_template = CheckItemTemplate.find(params[:id])
    @check_item_template.update_attributes(params[:check_item_template]) ? redirect_to(check_item_templates_path, :notice => "Item Saved") : flash[:error]
  end
   
   
   
  #   respond_to do |format|
  #     if @check_item_template.update_attributes(params[:check_item_template])
  #       format.html { redirect_to @check_item_template, notice: 'Check item template was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @check_item_template.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

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
    logger.info "CheckItemTemplatesController#clone CALLED: #{params[:check_list_id]}"
    if params[:check_list_id]
      @templates = CheckItemTemplate.all
      @templates.each do |template|
        item = CheckItem.new(name: template.name, area: template.area, item_order: template.item_order, check_list_id: params[:check_list_id])
        item.save if item.valid?
      end
    end
    redirect_to check_list_path(params[:check_list_id])
  end
end
