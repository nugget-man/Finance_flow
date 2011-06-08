class FlowlistsController < ApplicationController
  # GET /flowlists
  # GET /flowlists.xml
  def index
    @flowlists = Flowlist.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @flowlists }
    end
  end

  # GET /flowlists/1
  # GET /flowlists/1.xml
  def show
    @flowlist = Flowlist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @flowlist }
    end
  end

  # GET /flowlists/new
  # GET /flowlists/new.xml
  def new
    @flowlist = Flowlist.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @flowlist }
    end
  end

  # GET /flowlists/1/edit
  def edit
    @flowlist = Flowlist.find(params[:id])
  end

  # POST /flowlists
  # POST /flowlists.xml
  def create
    @flowlist = Flowlist.new(params[:flowlist])

    respond_to do |format|
      if @flowlist.save
        format.html { redirect_to(@flowlist, :notice => 'Flowlist was successfully created.') }
        format.xml  { render :xml => @flowlist, :status => :created, :location => @flowlist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @flowlist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /flowlists/1
  # PUT /flowlists/1.xml
  def update
    @flowlist = Flowlist.find(params[:id])

    respond_to do |format|
      if @flowlist.update_attributes(params[:flowlist])
        format.html { redirect_to(@flowlist, :notice => 'Flowlist was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @flowlist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /flowlists/1
  # DELETE /flowlists/1.xml
  def destroy
    @flowlist = Flowlist.find(params[:id])
    @flowlist.destroy

    respond_to do |format|
      format.html { redirect_to(flowlists_url) }
      format.xml  { head :ok }
    end
  end
end
