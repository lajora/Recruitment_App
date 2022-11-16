class JobApplicationsController < ApplicationController

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

  private
  
  def job_application_params
    params.require(:job_application).permit(:user_id, :years_of_experience, :availability, :document, :salary_expectation)
  end
end
