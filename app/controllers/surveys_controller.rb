class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    @ran1 = ''
    @ran2 = ''
    unless params['ran_1'].blank? && params['ran_2'].blank?
      @ran1 = ("%f" % params['ran_1'].gsub(' ','+')).sub(/\.?0*$/, "")
      @ran2 = ("%f" % params['ran_2'].gsub(' ','+')).sub(/\.?0*$/, "")
    end
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # GET /surveys/1/edit
  def edit
    authorize @survey
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)
    authorize @survey

    if @survey.save
      redirect_to surveys_path
      flash[:success] = 'Survey was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    authorize @survey

    if @survey.update(survey_params)
      redirect_to surveys_path
      flash[:success] = 'Survey was successfully updated.'
    else
      render :edit
    end

  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    authorize @survey
    @survey.destroy

    redirect_to surveys_path
    flash[:success] = 'Survey was successfully destroyed.'

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:name, :description, :afterword)
    end
end
