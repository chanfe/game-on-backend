class ScoresController < ApplicationController

  def index
    @scores = Score.all
    render json: @scores
  end

  def show
    @score = Score.find(params[:id])
    render json: @score
  end

  def create
    @score = Score.create(strong_params)
    render json: @score, status: 201
  end

  def update
    @score = Score.find(params[:id])
    unless @score.nil?
      @score.update(strong_params)
      render json: @score
    else
      render json: { error: "Score not Found!" }, status: 404
    end
  end

  def destroy
    @score = Score.find(params[:id])
    unless @score.nil?
      @score.destroy
      render json: @score
    else
      render json: { error: "Score not Found!" }, status: 404
    end
  end

  private
  def strong_params
    params.require(:score).permit(:id, :user_id, :points, :scoreTable_id)
  end

end
