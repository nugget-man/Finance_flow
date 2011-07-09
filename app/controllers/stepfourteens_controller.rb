class StepfourteensController < ApplicationController
  # GET /stepfourteens
  # GET /stepfourteens.xml
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction
  def index
    @stepfourteens = Stepfourteen.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stepfourteens }
    end
  end

  # GET /stepfourteens/1
  # GET /stepfourteens/1.xml
  def show
    @stepfourteen = Stepfourteen.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stepfourteen }
    end
  end

  # GET /stepfourteens/new
  # GET /stepfourteens/new.xml
  def new
    @stepthirteen = Stepthirteen.new
    @customer = Customer.find_by_id(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stepthirteen }

    end
  end

  # GET /stepfourteens/1/edit
  def edit
    @stepfourteen = Stepfourteen.find_by_customer_id(params[:id])
    @customer = Customer.find_by_id(params[:id])
  end

  # POST /stepfourteens
  # POST /stepfourteens.xml
  def create
    @stepfourteen = Stepfourteen.new(params[:stepfourteen])

    respond_to do |format|
      if @stepfourteen.save
        format.html { redirect_to(@stepfourteen, :notice => 'Stepfourteen was successfully created.') }
        format.xml  { render :xml => @stepfourteen, :status => :created, :location => @stepfourteen }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stepfourteen.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stepfourteens/1
  # PUT /stepfourteens/1.xml
  def update
    @stepfourteen = Stepfourteen.find(params[:id])

    respond_to do |format|
      if @stepfourteen.update_attributes(params[:stepfourteen])
        format.html { redirect_to(@stepfourteen, :notice => 'Stepfourteen was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stepfourteen.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stepfourteens/1
  # DELETE /stepfourteens/1.xml
  def destroy
    @stepfourteen = Stepfourteen.find(params[:id])
    @stepfourteen.destroy

    respond_to do |format|
      format.html { redirect_to(stepfourteens_url) }
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
