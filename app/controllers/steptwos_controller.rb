class SteptwosController < ApplicationController
  # GET /steptwos
  # GET /steptwos.xml
  def index
    @steptwos = Steptwo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @steptwos }
    end
  end

  # GET /steptwos/1
  # GET /steptwos/1.xml
  def show
    @steptwo = Steptwo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @steptwo }
    end
  end

  # GET /steptwos/new
  # GET /steptwos/new.xml
  def new
    @steptwo = Steptwo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @steptwo }
    end
  end

  # GET /steptwos/1/edit
  def edit
    @steptwo = Steptwo.find(params[:id])
  end

  # POST /steptwos
  # POST /steptwos.xml
  def create
    @steptwo = Steptwo.new(params[:steptwo])

    respond_to do |format|
      if @steptwo.save
        format.html { redirect_to(@steptwo, :notice => 'Steptwo was successfully created.') }
        format.xml  { render :xml => @steptwo, :status => :created, :location => @steptwo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @steptwo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /steptwos/1
  # PUT /steptwos/1.xml
  def update
    @steptwo = Steptwo.find(params[:id])

    respond_to do |format|
      if @steptwo.update_attributes(params[:steptwo])
        format.html { redirect_to(@steptwo, :notice => 'Steptwo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @steptwo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /steptwos/1
  # DELETE /steptwos/1.xml
  def destroy
    @steptwo = Steptwo.find(params[:id])
    @steptwo.destroy

    respond_to do |format|
      format.html { redirect_to(steptwos_url) }
      format.xml  { head :ok }
    end
  end
end
