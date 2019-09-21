class Ai::HomePriceController < ApplicationController
  protect_from_forgery
  skip_before_action :verify_authenticity_token
  def index
  end
  
  def new
    @stations = ["近鉄奈良","奈良","大和西大寺","学園前","高の原","新大宮","富雄","学研奈良登美ヶ丘","西ノ京","菖蒲池","平城山","尼ヶ辻","京終","帯解","平城"]
    @plans = ["1R","1K","1DK","1LDK","2K","2DK","2LDK","3K","3DK","3LDK","4K","4DK","4LDK","5R以上"]
    render json: {stations: @stations, plans: @plans}
    
  end
  
  def create
    stations = ["近鉄奈良","奈良","大和西大寺","学園前","高の原","新大宮","富雄","学研奈良登美ヶ丘","西ノ京","菖蒲池","平城山","尼ヶ辻","京終","帯解","平城"]
    plans = ["1R","1K","1DK","1LDK","2K","2DK","2LDK","3K","3DK","3LDK","4K","4DK","4LDK","5R以上"]
    exec_str = "python lib/python/main.py"
    exec_str += " #{params[:room][:area]}"
    exec_str += " #{stations.index(params[:room][:station_id])}"
    exec_str += " #{plans.index(params[:room][:plan_id])}"
    exec_str += " #{params[:room][:age]}"
    exec_str += " #{params[:room][:min_time_to_house]}"
    price = IO.popen(exec_str, "r+") {|io| io.gets }
    price = price.to_f.floor(1).to_s + "万円"
    
    render json: {price: price}
  end

end
