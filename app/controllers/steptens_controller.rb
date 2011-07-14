class SteptensController < ApplicationController
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction

  # GET /steptens
  # GET /steptens.xml
  def index
    @steptens = Stepten.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @steptens }
    end
  end

  # GET /steptens/1
  # GET /steptens/1.xml
  def show
    @stepten = Stepten.find_by_customer_id(params[:id])
    @customer = Customer.find(params[:id])
    if Comment.find_by_commentable_id_and_title(params[:id],"Specs & Bids Signed")
      @comments = Comment.find_all_by_commentable_id_and_title(params[:id],"Specs & Bids Signed")
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stepten }
    end
  end

  # GET /steptens/new
  # GET /steptens/new.xml
  def new
    @stepten = Stepten.new
    @customer = Customer.find_by_id(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stepten }
    end
  end

  # GET /steptens/1/edit
  def edit
    @stepten = Stepten.find_by_customer_id(params[:id])
    @customer = Customer.find_by_id(params[:id])
  end

  # POST /steptens
  # POST /steptens.xml
  def create
    @stepten = Stepten.new(params[:stepten])

    respond_to do |format|
      if @stepten.save
        format.html { redirect_to(root_path, :notice => 'Stepten was successfully created.') }
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
        format.html { redirect_to(root_path, :notice => 'Stepten was successfully updated.') }
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
    private
  def sort_column
    Customer.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
  end


  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
