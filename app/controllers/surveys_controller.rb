class SurveysController < ApplicationController

  def new
    @migraine = Migraine.find(current_migraine.id)
    @survey = Survey.new
  end

  def create
    @migraine = Migraine.find(current_migraine.id)
    @survey = @migraine.surveys.build(survey_params)
    @survey.migraine = current_migraine

    if @survey.save
      flash[:notice] = "Survey was saved."
      redirect_to migraine_path(current_migraine.id)
    else
      flash.now[:alert] = "There was an error saving the survey. Please try again."
      render :new
    end
  end

  def destroy
    @survey = Survey.find(params[:id])

    if @survey.destroy
      flash[:notice] = "Survey that happened at #{@survey.occurrence_time} was deleted successfully."
       redirect_to migraine_path
    else
      flash.now[:alert] = "There was an error deleting the survey."
       redirect_to migraine_path
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:migraine_id, :intensity, :occurrence_time)
  end

end
