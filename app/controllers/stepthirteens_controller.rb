class StepthirteensController < ApplicationController
  # GET /stepthirteens
  # GET /stepthirteens.xml
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction
  def index
    @stepthirteens = Stepthirteen.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stepthirteens }
    end
  end

  # GET /stepthirteens/1
  # GET /stepthirteens/1.xml
  def show
    @stepthirteen = Stepthirteen.find_by_customer_id(params[:id])
    @customer = Customer.find(params[:id])
    if Comment.find_by_commentable_id_and_title(params[:id],"Final Underwriting")
      @comments = Comment.find_all_by_commentable_id_and_title(params[:id],"Final Underwriting")
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stepthirteen }
    end
  end

  # GET /stepthirteens/new
  # GET /stepthirteens/new.xml
  def new
    @stepthirteen = Stepthirteen.new
    @customer = Customer.find_by_id(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stepthirteen }

    end
  end

  # GET /stepthirteens/1/edit
  def edit
    @stepthirteen = Stepthirteen.find(params[:id])
    @customer = Customer.find_by_id(params[:id])
  end

  # POST /stepthirteens
  # POST /stepthirteens.xml
  def create
    @stepthirteen = Stepthirteen.new(params[:stepthirteen])

    respond_to do |format|
      if @stepthirteen.save
        format.html { redirect_to(root_path, :notice => 'Stepthirteen was successfully created.') }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stepthirteen.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stepthirteens/1
  # PUT /stepthirteens/1.xml
  def update
    @stepthirteen = Stepthirteen.find(params[:id])

    respond_to do |format|
      if @stepthirteen.update_attributes(params[:stepthirteen])
        format.html { redirect_to(@stepthirteen, :notice => 'Stepthirteen was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stepthirteen.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stepthirteens/1
  # DELETE /stepthirteens/1.xml
  def destroy
    @stepthirteen = Stepthirteen.find(params[:id])
    @stepthirteen.destroy

    respond_to do |format|
      format.html { redirect_to(stepthirteens_url) }
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
