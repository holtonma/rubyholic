class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.xml
  def index
    per_page = 10 
    #take obfuscated col info and convert into real column info with private function:
    sort_params = Group.process_sort_params("#{params[:direction]}", "#{params[:order]}")
    #use real column info to sort
    sort_and_dir_str = "#{sort_params[:column]} #{sort_params[:direction]}"
    #@groups = Group.find_all_groups show_max, sort_and_dir_str, params[:page], 2
    
    if params[:q] == "" || params[:q] == nil
      @groups = Group.find_all_groups(sort_and_dir_str, params[:page], per_page)
    else
      @groups = Group.sortable_search(
        params[:q], sort_and_dir_str, params[:page], per_page
      ) 
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :layout => false, :xml => @groups.to_xml(:include => [:events, :locations]) }
      format.json { render :layout => false, :json => @groups.to_json(:include => [:events, :locations]) }
    end
  end

  # GET /groups/1
  # GET /groups/1.xml
  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.xml
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.xml
  def create
    
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        flash[:notice] = 'Group was successfully created.'
        format.html { redirect_to(@group) }
        format.xml  { render :xml => @group, :status => :created, :location => @group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.xml
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        flash[:notice] = 'Group was successfully updated.'
        format.html { redirect_to(@group) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.xml
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to(groups_url) }
      format.xml  { head :ok }
    end
  end
  
  
    
end
