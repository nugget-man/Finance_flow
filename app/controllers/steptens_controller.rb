class SteptensController < ApplicationController
  before_filter :authenticate_user!

  # GET /steptens
  # GET /steptens.xml
  def index
    @steptens = Stepten.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @steptens }
    end
  end

  # GET /steptens/1
  # GET /steptens/1.xml
  def show
    @stepten = Stepten.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stepten }
    end
  end

  # GET /steptens/new
  # GET /steptens/new.xml
  def new
    @stepten = Stepten.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stepten }
    end
  end

  # GET /steptens/1/edit
  def edit
    @stepten = Stepten.find(params[:id])
  end

  # POST /steptens
  # POST /steptens.xml
  def create
    @stepten = Stepten.new(params[:stepten])

    respond_to do |format|
      if @stepten.save
        format.html { redirect_to(@stepten, :notice => 'Stepten was successfully created.') }
        format.xml  { render :xml => @stepten, :status => :created, :location => @stepten }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stepten.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /steptens/1
  # PUT /steptens/1.xml
  def update
    @stepten = Stepten.find(params[:id])

    respond_to do |format|
      if @stepten.update_attributes(params[:stepten])
        format.html { redirect_to(@stepten, :notice => 'Stepten was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stepten.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /steptens/1
  # DELETE /steptens/1.xml
  def destroy
    @stepten = Stepten.find(params[:id])
    @stepten.destroy

    respond_to do |format|
      format.html { redirect_to(steptens_url) }
      format.xml  { head :ok }
    end
  end
end