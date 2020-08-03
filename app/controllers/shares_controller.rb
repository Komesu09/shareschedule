class SharesController < ApplicationController
  def index
       
  end
  def new
    @share = Share.new
    @share.users << current_user
  end

  def create
    @share = Share.new(share_params)
    if @share.save
      redirect_to root_path, notice: 'カレンダーを作成しました'
    else
      render :new
    end
  end

  def edit
    @share = Share.find(params[:id])
  end
  
  def update
    @share = Share.find(params[:id])
    if @share.update(share_params)
      redirect_to root_path, notice: 'カレンダーを更新しました'
    else
      render :edit
    end
  end
  private
  def share_params
    params.require(:share).permit(:name, user_ids: [])
  end
end
