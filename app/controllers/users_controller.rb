class UsersController < ApplicationController
  # get リクエストはshowで受け取る。urlの数字をparamsで受け取る

  # debbugerでエラーを直す
  def show
    @user = User.find(params[:id])
    @num = params[:id]
    # debugger # ターミナルで出てくる。@user.nameとか使える Ctr+D
  end 

  # formが実行されたら、この２つが実行される
  def new
    # debugger
    @user = User.new
  end

  def create
    # @user = User.new(params[:user]) # postリクエストから情報を受け取る。だが、これだと怪しい情報も付与されるかも。必要な情報だけ受け取るようにする必要あり
    @user = User.new(user_params)
    if @user.save
      # 保存成功処理
    else
      render "new"
    end
  end

  private

  # 外部から使えないように、必要ない情報は受け取らないようにする。
    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end
end
