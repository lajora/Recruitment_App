class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @jobs = Job.paginate(page: params[:page])
  end

  def show
    @job = Job.find(params[:id])
    @job_applications = @job.job_applications
    @stages = ['Application recieved', 'Screening call', 
    "Technical test", 'Interview', 'Second Interview', 'Send Offer']
  end 

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user

    if @job.save!
      redirect_to jobs_path
    else
      render :new
    end
  end 

  def edit
    @job = Job.find(params[:id])
  end 

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)

    if @job.save!
      redirect_to job_path
    else
      render :show
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path
  end 

  private

  def job_params
    params.require(:job).permit(:user_id, :title, :description, :location, :salary, :start_date, :end_date, :years_of_experience, :working_hours)
  end

end
