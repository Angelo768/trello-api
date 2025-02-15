class ListsController < ApplicationController
  include ListsHelper
  before_action :authenticate_user!
  before_action :set_list, only: [:show, :update, :destroy]

  # GET /lists
  def index
    @lists = List.all

    render json: @lists, except: [:created_at, :updated_at], include: {board: {only: [:name]}}
  end

  # GET /lists/1
  def show
    render json: @list, include: {tasks: {only: [:id, :name, :description]}}
  end

  # POST /lists
  def create
    @list = List.new(list_params)

    if @list.save
      render json: @list, status: :created, location: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lists/1
  def update
    if @list.update(list_params)
      render json: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lists/1
  def destroy
    remove_list
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def list_params
      params.permit(:board_id, :name)
    end
end
