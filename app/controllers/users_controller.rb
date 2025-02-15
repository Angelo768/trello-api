class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  def index
    @users = User.all

    render :json => @users
  end

  def show
    render :json => @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render :json => @user, status: :created, location: @user
    else
      render :json => @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy

    render :json => {message: "Usuário removido com sucesso"}, status: :ok
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:email, :password, :name, :nickname)      
    end

end
