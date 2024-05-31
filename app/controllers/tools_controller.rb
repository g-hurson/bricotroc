class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :destroy]

  def index
    if params[:category].nil?
      @tools = Tool.all
      puts "\n\nCOULDNT FIND ANY CATEGORY\n\n"
    elsif params[:category].empty?
      @tools = Tool.all.select do |tool|
        (distance_in_km_between_earth_coordinates(params[:positionLat].to_f,
                                                  params[:positionLong].to_f,
                                                  tool.latitude,
                                                  tool.longitude) <= params[:distance].to_f)
      end
      puts "\n\SHOWING ALL CATEGORIES\n\n"
    else
      @tools = Tool.all.select do |tool|
        (tool.category == params[:category]) &&
          (distance_in_km_between_earth_coordinates(params[:positionLat].to_f,
                                                    params[:positionLong].to_f,
                                                    tool.latitude,
                                                    tool.longitude) <= params[:distance].to_f)
      end
    end
    @markers = @tools.geocoded.map do |tool|
      {
        lat: tool.latitude,
        lng: tool.longitude
      }
    end
    @tool = Tool.new
    @booking = Booking.new
  end

  def show
    @booking = Booking.new
  end

  def my_tools
    @tools = current_user.tools
    @tool = Tool.new
    @tool.user = current_user
  end

  def create
    @tools = Tool.all
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    @tool.rating = (0..5).to_a.sample
    if @tool.save
      redirect_to my_tools_path
    else
      @show_form = true
      render "my_tools", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @tool.destroy
    redirect_to my_tools_path, status: :see_other
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :description, :category, :condition, :rating, :brand, :address)
  end

  def set_tool
    @tool = Tool.find(params[:id])
  end

  def degrees_to_radians(degrees)
    degrees * Math::PI / 180.0
  end

  def distance_in_km_between_earth_coordinates(lat1, lon1, lat2, lon2)
    earth_radius_km = 6371.0

    d_lat = degrees_to_radians(lat2 - lat1)
    d_lon = degrees_to_radians(lon2 - lon1)

    lat1 = degrees_to_radians(lat1)
    lat2 = degrees_to_radians(lat2)

    a = Math::sin(d_lat / 2.0) * Math::sin(d_lat / 2.0) +
        Math::sin(d_lon / 2.0) * Math::sin(d_lon / 2.0) * Math::cos(lat1) * Math::cos(lat2)
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1 - a))

    earth_radius_km * c
  end
end
