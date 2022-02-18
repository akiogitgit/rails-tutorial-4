class UsersController < ApplicationController
  # get リクエストはshowで受け取る。urlの数字をparamsで受け取る

  # debbugerでエラーを直す
  def show
    @user = User.find(params[:id])
    @num = params[:id]
    # debugger # ターミナルで出てくる。@user.nameとか使える Ctr+D
  end 

  def new
    # debugger
  end

end
