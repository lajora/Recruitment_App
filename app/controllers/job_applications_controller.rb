class JobApplicationsController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :authenticate_user!
  before_action :has_applied?, only: [:new, :create]
  def index
    @job_applications = JobApplication.all.where(user_id: current_user).order("job_applications.created_at ASC")
  end

  def show
    @job_application = JobApplication.find(params[:id])
    @comment = @job_application.comments.build
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
      if @job_application.stage == "Technical test"
        UserMailer.send_challenge(@job_application.user, @job_application).deliver_now
      elsif @job_application.stage == "Send Offer"
        UserMailer.send_offer(@job_application.user, @job_application).deliver_now
      end
      redirect_to job_path(@job, anchor: dom_id(@job_application))
    end
  end

  def go_previous_stage
    @job_application = JobApplication.find(params[:id])
    @job = Job.find(@job_application.job.id)
    @job_application.update(stage: @job_application.previous_stage)
    if @job_application.save!
      if @job_application.stage == "Technical test"
        UserMailer.send_challenge(@job_application.user, @job_application).deliver_now
      end
      redirect_to job_path(@job, anchor: dom_id(@job_application))
    end
  end

  def reject
    @job_application = JobApplication.find(params[:id])
    @job = Job.find(@job_application.job.id)
    @job_application.update(status: @job_application.reject_application)
    if @job_application.save!
      UserMailer.reject_candidate(@job_application.user, @job_application).deliver_now
      redirect_to job_path(@job, anchor: dom_id(@job_application))
    end
  end

  def accept_offer
    @job_application = JobApplication.find(params[:id])
    @job_application.update(status: 'accepted', stage: 'Hired')
    if @job_application.save!
      redirect_to job_applications_path
    end
  end

  def reject_offer
    @job_application = JobApplication.find(params[:id])
    @job_application.update(status: 'rejected', stage: 'Offer Rejected')
    if @job_application.save!
      redirect_to job_applications_path
    end
  end
  private
  
  def job_application_params
    params.require(:job_application).permit(:user_id, :years_of_experience, :availability, :document, :salary_expectation)
  end

  def has_applied?
    @job = Job.find(params[:job_id])
    if JobApplication.where(job_id: params[:job_id], user_id: current_user.id).any?
      redirect_to job_path(@job), alert: "You already applied to this job"
    end
  end
end
