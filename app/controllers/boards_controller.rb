class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: [:show, :update, :destroy]

  # GET /boards
  def index
    @boards = Board.all

    render json: @boards, except: [:user_id, :created_at, :updated_at], include: {user: {only: [:name, :email]}}
  end

  # GET /boards/1
  def show
    render json: @board, include: {
      lists: {only: [:id, :name], include: {
        tasks: {only: [:id, :name, :description]}}
        }}
  end

  # POST /boardsboard_id: self.id, name: "TO DO"
  def create
    @board = Board.new(board_params)

    if @board.save
      render json: @board, status: :created, location: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /boards/1
  def update
    if @board.update(board_params)
      render json: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  # DELETE /boards/1
  def destroy
    @board.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def board_params
      params.permit(:user_id, :name)
    end
end
