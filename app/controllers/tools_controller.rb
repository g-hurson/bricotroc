class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :destroy]

  def index
    if params[:tool].nil?
      @tools = Tool.all
    else
      @tools = Tool.all.select { |tool| tool.category == params[:tool][:category] }
      @tools = Tool.all if @tools.empty?
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
end
