class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :set_question

  # GET /answers
  # GET /answers.json
  def index
    @answers = answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = @question.answers.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer =  @question.answers.new(answer_params)

    if @answer.save
      # question_answer_path(@question, @answer)
      redirect_to [@survey, @question, @answers], notice: 'answer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update

      if @answer.update(answer_params)
        redirect_to [@question], notice: 'answer was successfully updated.'
      else
        render :edit
      end

  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy

    redirect_to edit_question_path(@question), notice: 'answer was successfully destroyed.'

  end

  private

    def set_question
      @question = question.find(params[:question_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      temp_params = params.require(:answer).permit(:q_type, :description, :settings, :question_id)
      temp_params[:settings] = JSON.parse(
        if temp_params[:settings].empty? then "{}" else temp_params[:settings] end)
      temp_params
    end
end
