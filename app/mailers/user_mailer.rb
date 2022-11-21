class UserMailer < ApplicationMailer
    default :from => "notifications@example.com"
 
  def send_challenge(user, job_application)
    @user = user
    @job_application = job_application
    attachments['Challenge_Exponential_function_approximation.pdf'] = File.read('Challenge_Exponential_function_approximation.pdf')
    mail(:to => user.email,
         :subject => "Coding challenge")
  end

  def send_offer(user, job_application)
    @user = user
    @job_application = job_application
    mail(:to => user.email,
        :subject => "Offer from Jobstantial")
  end

  def reject_candidate(user, job_application)
    @user = user
    @job_application = job_application
    mail(:to => user.email,
        :subject => "Application at Jobstantial")
  end
end
