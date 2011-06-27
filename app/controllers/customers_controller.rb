class CustomersController < ApplicationController
  # GET /customers
  # GET /customers.xml
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction
  def index
    @customers = Customer.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @customers }
    end

  end

  # GET /customers/1
  # GET /customers/1.xml
  def show
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @customer }
    end
  end

  # GET /customers/new
  # GET /customers/new.xml
  def new
    @customer = Customer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @customer }
    end
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
    # commentable = Customer.create
    # commentable.comments.create(:title => params[:title], :comment => params[:comment])
  end

  # POST /customers
  # POST /customers.xml
  def create
    @customer = Customer.new(params[:customer])

    respond_to do |format|
      if @customer.save
        format.html { redirect_to(@customer, :notice => 'Customer was successfully created.') }
        format.xml  { render :xml => @customer, :status => :created, :location => @customer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.xml
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to(@customer, :notice => 'Customer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.xml
  def destroy
    if Customer.find(params[:id]).destroy
      if Stepone.find_by_customer_id(params[:id]).destroy
        if Steptwo.find_by_customer_id(params[:id]).destroy
          if Stepthree.find_by_customer_id(params[:id]).destroy
            if Stepfour.find_by_customer_id(params[:id]).destroy
              if Stepfive.find_by_customer_id(params[:id]).destroy
                if Stepsix.find_by_customer_id(params[:id]).destroy
                  if Stepseven.find_by_customer_id(params[:id]).destroy
                    if Stepeight.find_by_customer_id(params[:id]).destroy
                      if Stepnine.find_by_customer_id(params[:id]).destroy
                        if Stepten.find_by_customer_id(params[:id]).destroy
                          #good job on making it this far!
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    respond_to do |format|
      format.html { redirect_to(customers_url) }
      format.xml  { head :ok }
    end
  end

  def currentstep
    @step = Customer.find_by_id(params[:id]).step
    if @step === nil
      Customer.find_by_id(params[:id]).update_attribute(:step, 0)
      redirect_to home_path
    elsif @step === 0
      Customer.find_by_id(params[:id]).update_attribute(:step, 1)
      redirect_to step1_path(params[:id])
    elsif @step === 1
      if @stepone = Stepone.find_by_customer_id(params[:id])
        @title = @stepone[:title]
      end
      if @title === 'In Progress'
        if @complete = @stepone[:complete]
          Stepone.find_by_customer_id(params[:id]).update_attribute(:title, 'Complete')
          Customer.find_by_id(params[:id]).update_attribute(:step, 2)
          redirect_to step2_path(params[:id])
        else
          redirect_to step1edit_path(params[:id])
        end
      elsif @title === 'Complete'
        Customer.find_by_id(params[:id]).update_attribute(:step, 2)
        redirect_to step2_path(params[:id])
      else
        redirect_to step1_path(params[:id])
      end
    elsif @step === 2
      if @steptwo = Steptwo.find_by_customer_id(params[:id])
        @title = @steptwo[:title]
      end
      if @title === 'In Progress'
        if @complete = @steptwo[:complete]
          Steptwo.find_by_customer_id(params[:id]).update_attribute(:title, 'Complete')
          Customer.find_by_id(params[:id]).update_attribute(:step, 3)
          redirect_to step3_path(params[:id])
        else
          redirect_to step2edit_path(params[:id])
        end
      elsif @title === 'Complete'
        Customer.find_by_id(params[:id]).update_attribute(:step, 3)
        redirect_to step3_path(params[:id])
      else
        redirect_to step2_path(params[:id])
      end
    elsif @step === 3
      if @stepthree = Stepthree.find_by_customer_id(params[:id])
        @title = @stepthree[:title]
      end
      if @title === 'In Progress'
        if @complete = @stepthree[:complete]
          Stepthree.find_by_customer_id(params[:id]).update_attribute(:title, 'Complete')
          Customer.find_by_id(params[:id]).update_attribute(:step, 4)
          redirect_to step4_path(params[:id])
        else
          redirect_to step3edit_path(params[:id])
        end
      elsif @title === 'Complete'
        Customer.find_by_id(params[:id]).update_attribute(:step, 4)
        redirect_to step4_path(params[:id])
      else
        redirect_to step3_path(params[:id])
      end
    elsif @step === 4
      if @stepfour = Stepfour.find_by_customer_id(params[:id])
        @title = @stepfour[:title]
      end
      if @title === 'In Progress'
        if @complete = @stepfour[:complete]
          Stepfour.find_by_customer_id(params[:id]).update_attribute(:title, 'Complete')
          Customer.find_by_id(params[:id]).update_attribute(:step, 5)
          redirect_to step5_path(params[:id])
        else
          redirect_to step4edit_path(params[:id])
        end
      elsif @title === 'Complete'
        Customer.find_by_id(params[:id]).update_attribute(:step, 5)
        redirect_to step5_path(params[:id])
      else
        redirect_to step4_path(params[:id])
      end
    elsif @step === 5
      if @stepfive = Stepfive.find_by_customer_id(params[:id])
        @title = @stepfive[:title]
      end
      if @title === 'In Progress'
        if @complete = @stepfive[:complete]
          Stepfive.find_by_customer_id(params[:id]).update_attribute(:title, 'Complete')
          Customer.find_by_id(params[:id]).update_attribute(:step, 6)
          redirect_to step6_path(params[:id])
        else
          redirect_to step5edit_path(params[:id])
        end
      elsif @title === 'Complete'
        Customer.find_by_id(params[:id]).update_attribute(:step, 6)
        redirect_to step6_path(params[:id])
      else
        redirect_to step5_path(params[:id])
      end
    elsif @step === 6
      if @stepsix = Stepsix.find_by_customer_id(params[:id])
        @title = @stepsix[:title]
      end
      if @title === 'In Progress'
        if @complete = @stepsix[:complete]
          Stepsix.find_by_customer_id(params[:id]).update_attribute(:title, 'Complete')
          Customer.find_by_id(params[:id]).update_attribute(:step, 7)
          redirect_to step7_path(params[:id])
        else
          redirect_to step6edit_path(params[:id])
        end
      elsif @title === 'Complete'
        Customer.find_by_id(params[:id]).update_attribute(:step, 7)
        redirect_to step7_path(params[:id])
      else
        redirect_to step6_path(params[:id])
      end
    elsif @step === 7
      if @stepseven = Stepseven.find_by_customer_id(params[:id])
        @title = @stepseven[:title]
      end
      if @title === 'In Progress'
        if @complete = @stepseven[:complete]
          Stepseven.find_by_customer_id(params[:id]).update_attribute(:title, 'Complete')
          Customer.find_by_id(params[:id]).update_attribute(:step, 8)
          redirect_to step8_path(params[:id])
        else
          redirect_to step7edit_path(params[:id])
        end
      elsif @title === 'Complete'
        Customer.find_by_id(params[:id]).update_attribute(:step, 8)
        redirect_to step8_path(params[:id])
      else
        redirect_to step7_path(params[:id])
      end
    elsif @step === 8
      if @stepeight = Stepeight.find_by_customer_id(params[:id])
        @title = @stepeight[:title]
      end
      if @title === 'In Progress'
        if @complete = @stepeight[:complete]
          Stepeight.find_by_customer_id(params[:id]).update_attribute(:title, 'Complete')
          Customer.find_by_id(params[:id]).update_attribute(:step, 9)
          redirect_to step9_path(params[:id])
        else
          redirect_to step8edit_path(params[:id])
        end
      elsif @title === 'Complete'
        Customer.find_by_id(params[:id]).update_attribute(:step, 9)
        redirect_to step9_path(params[:id])
      else
        redirect_to step8_path(params[:id])
      end
    elsif @step === 9
      if @stepnine = Stepnine.find_by_customer_id(params[:id])
        @title = @stepnine[:title]
      end
      if @title === 'In Progress'
        if @complete = @stepnine[:complete]
          Stepone.find_by_customer_id(params[:id]).update_attribute(:title, 'Complete')
          Customer.find_by_id(params[:id]).update_attribute(:step, 10)
          redirect_to step10_path(params[:id])
        else
          redirect_to step9edit_path(params[:id])
        end
      elsif @title === 'Complete'
        Customer.find_by_id(params[:id]).update_attribute(:step, 10)
        redirect_to step10_path(params[:id])
      else
        redirect_to step9_path(params[:id])
      end
    elsif @step === 10
      if @stepten = Stepten.find_by_customer_id(params[:id])
        @title = @stepten[:title]
      end
      if @title === 'In Progress'
        if @complete = @stepten[:complete]
          Stepten.find_by_customer_id(params[:id]).update_attribute(:title, 'Complete')
          Customer.find_by_id(params[:id]).update_attribute(:step, 99)
          redirect_to root_path
        else
          redirect_to step10edit_path(params[:id])
        end
      elsif @title === 'Complete'
        Customer.find_by_id(params[:id]).update_attribute(:step, 99)
        redirect_to home_path
      else
        redirect_to step10_path(params[:id])
      end
    elsif @step === 99
      redirect_to home_path
    end
  end

  private

  def sort_column
    Customer.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
  end


  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
  def finance_button
    @customer = customer.id
  end
end
