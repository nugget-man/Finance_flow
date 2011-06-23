class StepninesController < ApplicationController
  before_filter :authenticate_user!

  # GET /stepnines
  # GET /stepnines.xml
  def index
    @stepnines = Stepnine.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stepnines }
    end
  end

  # GET /stepnines/1
  # GET /stepnines/1.xml
  def show
    @stepnine = Stepnine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stepnine }
    end
  end

  # GET /stepnines/new
  # GET /stepnines/new.xml
  def new
    @stepnine = Stepnine.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stepnine }
    end
  end

  # GET /stepnines/1/edit
  def edit
    @stepnine = Stepnine.find(params[:id])
  end

  # POST /stepnines
  # POST /stepnines.xml
  def create
    @stepnine = Stepnine.new(params[:stepnine])

    respond_to do |format|
      if @stepnine.save
        format.html { redirect_to(root_path, :notice => 'Stepnine was successfully created.') }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stepnine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stepnines/1
  # PUT /stepnines/1.xml
  def update
    @stepnine = Stepnine.find(params[:id])

    respond_to do |format|
      if @stepnine.update_attributes(params[:stepnine])
        format.html { redirect_to(root_path, :notice => 'Stepnine was successfully updated.') }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stepnine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stepnines/1
  # DELETE /stepnines/1.xml
  def destroy
    @stepnine = Stepnine.find(params[:id])
    @stepnine.destroy

    respond_to do |format|
      format.html { redirect_to(stepnines_url) }
      format.xml  { head :ok }
    end
  end
end
