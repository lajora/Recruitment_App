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
  end

  def job_application_params
    params.require(:job_application).permit(:user_id)
  end
end
