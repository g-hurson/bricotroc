class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :create]

  def index
    if params[:category].nil?
      @tools = Tool.all
      puts "\n\nCOULDNT FIND ANY CATEGORY\n\n"
    else
      @tools = Tool.all.select do |tool|
        (tool.category == params[:category]) &&
          (distance_in_km_between_earth_coordinates(params[:positionLat].to_f,
                                                    params[:positionLong].to_f,
                                                    tool.latitude,
                                                    tool.longitude) <= params[:distance].to_f)
      end
    end
    @tool = Tool.new
    @booking = Booking.new
  end

  def show
    @booking = Booking.new
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def tool_params

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
