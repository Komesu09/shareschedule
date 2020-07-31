class CalendarsController < ApplicationController
  def  new
    @calendar = Calendar.new
    @calendar.users << current_user
  end

  def create
    @calendar = Calendar.new(calendar_params)
    if @calendar.save
      redirect_to root_path, notice: 'カレンダーを作成しました'
    else
      render :new
    end
  end

  def add
    
  end

  private
  def calendar_params
    params.require(:calendar).permit(:name, user_ids: [])
  end
end
