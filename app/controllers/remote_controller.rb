class RemoteController < ApplicationController
  before_filter :authenticate_user!

  def new
  end

  def back
  end

  def forward
  end

  def home
  end

end
