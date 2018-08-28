class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update, :destroy]
  before_action :set_page
  before_action :set_survey

  # GET /questions
  # GET /questions.json
  def index
    @questions = @page.questions.all
  end

  # GET /questions/new
  def new
    @question = @page.questions.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question =  @page.questions.new(question_params)

    if @question.save
      # survey_question_path(@survey, @question)
      redirect_to survey_page_question_path(@survey, @page, @question)
      flash[:success] = 'Question was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update

    if @question.update(question_params)
      redirect_to survey_page_question_path(@survey, @page, @question)
      flash[:success] = 'Question was successfully updated.'
    else
      render :edit
    end

  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy

    redirect_to edit_survey_page_path(@survey, @page)
    flash[:success] = 'Question was successfully destroyed.'

  end

  private

    def set_survey
      @survey = Survey.find(params[:survey_id])
    end

    def set_page
      @page = Page.find(params[:page_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      temp_params = params.require(:question).permit(
        :q_type, :description, :settings, :page_id)
      temp_params[:settings] = JSON.parse(
        if temp_params[:settings].empty? then "{}" else temp_params[:settings] end)
      temp_params
    end
end
