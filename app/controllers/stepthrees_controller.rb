class StepthreesController < ApplicationController
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction
  # GET /stepthrees
  # GET /stepthrees.xml
  def index
    @stepthrees = Stepthree.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stepthrees }
    end
  end

  # GET /stepthrees/1
  # GET /stepthrees/1.xml
  def show
    @stepthree = Stepthree.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stepthree }
    end
  end

  # GET /stepthrees/new
  # GET /stepthrees/new.xml
  def new
    @stepthree = Stepthree.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stepthree }
    end
  end

  # GET /stepthrees/1/edit
  def edit
    @stepthree = Stepthree.find(params[:id])
  end

  # POST /stepthrees
  # POST /stepthrees.xml
  def create
    @stepthree = Stepthree.new(params[:stepthree])

    respond_to do |format|
      if @stepthree.save
        format.html { redirect_to(root_path, :notice => 'Stepthree was successfully created.') }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stepthree.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stepthrees/1
  # PUT /stepthrees/1.xml
  def update
    @stepthree = Stepthree.find(params[:id])

    respond_to do |format|
      if @stepthree.update_attributes(params[:stepthree])
        format.html { redirect_to(root_path, :notice => 'Stepthree was successfully updated.') }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stepthree.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stepthrees/1
  # DELETE /stepthrees/1.xml
  def destroy
    @stepthree = Stepthree.find(params[:id])
    @stepthree.destroy

    respond_to do |format|
      format.html { redirect_to(stepthrees_url) }
      format.xml  { head :ok }
    end
  end
  private
  def sort_column
    Customer.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
  end


  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end


end
