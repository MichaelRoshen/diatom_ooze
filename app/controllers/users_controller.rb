#encoding: utf-8
class UsersController < ApplicationController
  # GET /users
  # GET /users.json

  def login
    uname=params[:user][:name]
    upass=params[:user][:pass]
    user = User.find_by_name_and_password(uname,upass)
    session[:user_id] = nil
    if user
      session[:user_id] = user.id
      redirect_to "/" , :notice => "login successfully!"
    else
      redirect_to "/home/login" , :notice => "failed!"
    end
  end

  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # 报名比赛
  def enroll
    @game = Game.all_games.last
    if session[:user_id].nil?
      redirect_to "/home/enroll_success" , :notice => "登录后报名！"
    else
      if Enlist.where({user_id: session[:user_id], game_id: params[:game_id]}).first.present?
        redirect_to "/home/enroll_success", :notice => "已经报名了，再报扣钱啊！"
      else
        Enlist.create({user_id: session[:user_id], game_id: params[:game_id]})
        redirect_to "/home/enroll_success", :notice => "报名成功！"
        end  
      end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
