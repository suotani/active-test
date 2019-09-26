class ActiveTestController < ApplicationController
  before_action :check_param
  def index
  end
  
  private
  
  def check_param
    unless params[:pass] || params[:pass] == "uotani"
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
  end

end
