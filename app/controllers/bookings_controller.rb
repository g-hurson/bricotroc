class BookingsController < ApplicationController
  # before_action :set_booking, only: #[à définir]
  before_action :set_tool, only: %i[new create]

  def new
  end

  def show
  end

  def index
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.tool = @tool
    @booking.status = Booking::STATUS[0]
    raise
    if @booking.save
      redirect_to tool_path(@tool)
    else
      render "tools/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end

  def set_booking
    @booking = Booking.new
  end

  def set_tool
    @tool = Tool.find(params[:tool_id])
  end
end
