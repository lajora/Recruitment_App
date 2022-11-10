class JobApplicationsController < ApplicationController

  def index
    @job_applications = JobApplication.all
  end

  def show
  end
end
