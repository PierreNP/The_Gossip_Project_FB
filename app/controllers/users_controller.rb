class UsersController < ApplicationController

  before_action :authenticate_user


  def index
    @all_users = User.all
  end

  def show
    @num = params[:id]
  end

  def new
    @new_user = User.new
  end

  def create
    puts "🪲"*60
    puts params.inspect
    puts "🪲"*60

    User.create(params.require(:user).permit(:first_name, :last_name, :email, :password, :city_id))

    redirect_to gossip_index_path

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def authenticate_user
    if session[:user_id] == nil
      redirect_to new_session_path
    end 
  end 


end
