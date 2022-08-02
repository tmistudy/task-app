class UsersController < ApplicationController
  def index
    @users = User.all
    @length = @users.length
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:title, :start, :end_day, :all_day, :memo))
    if @user.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to :users
    else
      flash[:notice_fail] = "スケジュールを登録できませんでした"
      render "new",status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:title, :start, :end_day, :all_day, :memo))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :users
    else
      flash[:notice_fail] = "スケジュールを更新できませんでした"
      render "edit",status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :users, status: :see_other
  end
end
