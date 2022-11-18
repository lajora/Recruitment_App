class JobApplicationsController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :authenticate_user!
  def index
    @job_applications = JobApplication.all.where(user_id: current_user).order("job_applications.created_at ASC")
  end

  def show
    @job_application = JobApplication.find(params[:job_application_id])
  end

  def new
    @job_application = JobApplication.new
  end 

  def create
    @job = Job.find(params[:job_id])
    @job_application = JobApplication.new(job_application_params)
    @job_application.job = @job
    @job_application.user = current_user
    
    if @job_application.save!
      redirect_to jobs_path
    else
      render :new
    end
  end

  def go_next_stage
    @job_application = JobApplication.find(params[:id])
    @job = Job.find(@job_application.job.id)
    @job_application.update(stage: @job_application.next_stage)
    if @job_application.save!
      redirect_to job_path(@job, anchor: dom_id(@job_application))
    end
  end

  def go_previous_stage
    @job_application = JobApplication.find(params[:id])
    @job = Job.find(@job_application.job.id)
    @job_application.update(stage: @job_application.previous_stage)
    if @job_application.save!
      redirect_to job_path(@job, anchor: dom_id(@job_application))
    end
  end
  private
  
  def job_application_params
    params.require(:job_application).permit(:user_id, :years_of_experience, :availability, :document, :salary_expectation)
  end
end
