class MyCalendarsController < ApplicationController

  def index
       
  end
  def new
    @my_calendar = MyCalendar.new
    @my_calendar.users << current_user
  end

  def create
    @my_calendar = MyCalendar.new(my_calendar_params)
    if @my_calendar.save
      redirect_to root_path, notice: 'カレンダーを作成しました'
    else
      render :new
    end
  end

  def edit
    @my_calendar = MyCalendar.find(params[:id])
  end
  
  def update
    @my_calendar = MyCalendar.find(params[:id])
    if @my_calendar.update(my_calendar_params)
      redirect_to root_path, notice: 'カレンダーを更新しました'
    else
      render :edit
    end
  end
  private
  def my_calendar_params
    params.require(:my_calendar).permit(:name, user_ids: [])
  end
end
