class FlowonesController < ApplicationController
  # GET /flowones
  # GET /flowones.xml
  def index
    @flowones = Flowone.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @flowones }
    end
  end

  # GET /flowones/1
  # GET /flowones/1.xml
  def show
    @flowone = Flowone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @flowone }
    end
  end

  # GET /flowones/new
  # GET /flowones/new.xml
  def new
    @flowone = Flowone.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @flowone }
    end
  end

  # GET /flowones/1/edit
  def edit
    @flowone = Flowone.find(params[:id])
  end

  # POST /flowones
  # POST /flowones.xml
  def create
    @flowone = Flowone.new(params[:flowone])

    respond_to do |format|
      if @flowone.save
        format.html { redirect_to(@flowone, :notice => 'Flowone was successfully created.') }
        format.xml  { render :xml => @flowone, :status => :created, :location => @flowone }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @flowone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /flowones/1
  # PUT /flowones/1.xml
  def update
    @flowone = Flowone.find(params[:id])

    respond_to do |format|
      if @flowone.update_attributes(params[:flowone])
        format.html { redirect_to(@flowone, :notice => 'Flowone was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @flowone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /flowones/1
  # DELETE /flowones/1.xml
  def destroy
    @flowone = Flowone.find(params[:id])
    @flowone.destroy

    respond_to do |format|
      format.html { redirect_to(flowones_url) }
      format.xml  { head :ok }
    end
  end
end
