require "test_helper"

class JobApplicationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @job_application = JobApplication.create(status: 'rejected', stage: 'interview')
  end 

  test 'should be valid' do
   @job_application.valid?
  end
end
