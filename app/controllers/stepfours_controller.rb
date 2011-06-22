class StepfoursController < ApplicationController
  before_filter :authenticate_user!

  # GET /stepfours
  # GET /stepfours.xml
  def index
    @stepfours = Stepfour.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stepfours }
    end
  end

  # GET /stepfours/1
  # GET /stepfours/1.xml
  def show
    @stepfour = Stepfour.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stepfour }
    end
  end

  # GET /stepfours/new
  # GET /stepfours/new.xml
  def new
    @stepfour = Stepfour.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stepfour }
    end
  end

  # GET /stepfours/1/edit
  def edit
    @stepfour = Stepfour.find(params[:id])
  end

  # POST /stepfours
  # POST /stepfours.xml
  def create
    @stepfour = Stepfour.new(params[:stepfour])

    respond_to do |format|
      if @stepfour.save
        format.html { redirect_to(@stepfour, :notice => 'Stepfour was successfully created.') }
        format.xml  { render :xml => @stepfour, :status => :created, :location => @stepfour }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stepfour.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stepfours/1
  # PUT /stepfours/1.xml
  def update
    @stepfour = Stepfour.find(params[:id])

    respond_to do |format|
      if @stepfour.update_attributes(params[:stepfour])
        format.html { redirect_to(@stepfour, :notice => 'Stepfour was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stepfour.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stepfours/1
  # DELETE /stepfours/1.xml
  def destroy
    @stepfour = Stepfour.find(params[:id])
    @stepfour.destroy

    respond_to do |format|
      format.html { redirect_to(stepfours_url) }
      format.xml  { head :ok }
    end
  end
end
