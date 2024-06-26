class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]
  before_action :set_tool, only: %i[new create]

  def show
  end

  def index
    @bookings = current_user.bookings
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.tool = @tool
    @booking.status = Booking::STATUS[0]
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render "tools/show", status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_tool
    @tool = Tool.find(params[:tool_id])
  end
end
