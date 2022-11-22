class RemarksController < ApplicationController
    def index
        @job_application = JobApplication.find(params[:job_application_id])
        @remarks = Remark.All
      end
    
      def new
       @remark = Remark.new 
      end 
    
      def create
        @job_application = JobApplication.find(params[:job_application_id])
        @remark = Remark.new(remark_params)
        @remark.job_application = @job_application
        @remark.user = current_user
    
        respond_to do |format|
          if @remark.save
            format.html { redirect_to job_application_path(@job_application), notice: "Remark was successfully created." }
          else
            format.html { redirect_to job_application_path(@job_application) }
          end
        end
      end
    
      def remark_params
        params.require(:remark).permit(:job_application_id, :user_id, :content)
      end
    
    
end
