class StepfifteensController < ApplicationController
  # GET /stepfifteens
  # GET /stepfifteens.xml
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction
  def index
    @stepfifteens = Stepfifteen.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stepfifteens }
    end
  end

  # GET /stepfifteens/1
  # GET /stepfifteens/1.xml
  def show
    @stepfifteen = Stepfifteen.find_by_customer_id(params[:id])
    @customer = Customer.find(params[:id])
    if Comment.find_by_commentable_id_and_title(params[:id],"Schedule Close")
      @comments = Comment.find_all_by_commentable_id_and_title(params[:id],"Schedule Close")
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stepfifteen }
    end
  end

  # GET /stepfifteens/new
  # GET /stepfifteens/new.xml
  def new
    @stepfifteen = Stepfifteen.new
    @customer = Customer.find_by_id(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stepfifteen }
    end
  end

  # GET /stepfifteens/1/edit
  def edit
    @stepfifteen = Stepfifteen.find_by_customer_id(params[:id])
    @customer = Customer.find_by_id(params[:id])
  end

  # POST /stepfifteens
  # POST /stepfifteens.xml
  def create
    @stepfifteen = Stepfifteen.new(params[:stepfifteen])

    respond_to do |format|
      if @stepfifteen.save
        format.html { redirect_to(root_path, :notice => 'Stepfifteen was successfully created.') }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stepfifteen.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stepfifteens/1
  # PUT /stepfifteens/1.xml
  def update
    @stepfifteen = Stepfifteen.find(params[:id])

    respond_to do |format|
      if @stepfifteen.update_attributes(params[:stepfifteen])
        format.html { redirect_to(@stepfifteen, :notice => 'Stepfifteen was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stepfifteen.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stepfifteens/1
  # DELETE /stepfifteens/1.xml
  def destroy
    @stepfifteen = Stepfifteen.find(params[:id])
    @stepfifteen.destroy

    respond_to do |format|
      format.html { redirect_to(stepfifteens_url) }
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

