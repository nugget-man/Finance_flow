
  class CommentsController < ApplicationController
    before_filter :authenticate_user!, :load_commentable
    def create
      @customer = @customer.find params[:id]
      @comment = @customer.comments.new params[:comment]
      respond_to do |format|
        if @comment.save
          format.html { redirect_to @customer}
        else
          format.html { render :action => 'new' }
        end
      end
    end

    protected

    def load_commentable
      @commentable = params[:commentable_type].camelize.constantize.find(params[:commentable_id])
    end
  end
