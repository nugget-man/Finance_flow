class StepsixesController < ApplicationController
  before_filter :authenticate_user!

  # GET /stepsixes
  # GET /stepsixes.xml
  def index
    @stepsixes = Stepsix.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stepsixes }
    end
  end

  # GET /stepsixes/1
  # GET /stepsixes/1.xml
  def show
    @stepsix = Stepsix.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stepsix }
    end
  end

  # GET /stepsixes/new
  # GET /stepsixes/new.xml
  def new
    @stepsix = Stepsix.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stepsix }
    end
  end

  # GET /stepsixes/1/edit
  def edit
    @stepsix = Stepsix.find(params[:id])
  end

  # POST /stepsixes
  # POST /stepsixes.xml
  def create
    @stepsix = Stepsix.new(params[:stepsix])

    respond_to do |format|
      if @stepsix.save
        format.html { redirect_to(root_path, :notice => 'Stepsix was successfully created.') }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stepsix.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stepsixes/1
  # PUT /stepsixes/1.xml
  def update
    @stepsix = Stepsix.find(params[:id])

    respond_to do |format|
      if @stepsix.update_attributes(params[:stepsix])
        format.html { redirect_to(root_path, :notice => 'Stepsix was successfully updated.') }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stepsix.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stepsixes/1
  # DELETE /stepsixes/1.xml
  def destroy
    @stepsix = Stepsix.find(params[:id])
    @stepsix.destroy

    respond_to do |format|
      format.html { redirect_to(stepsixes_url) }
      format.xml  { head :ok }
    end
  end
end
