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

  test 'document should be present' do 
    @job_application.document_content_type = "    "
    assert_not @job_application.valid?
  end 

  test 'years_of_experience should be present' do 
    @job_application.years_of_experience = "     "
    assert_not @job_application.valid?
  end

  test 'availability should be present' do
    @job_application.availability = "   "
    assert_not @job_application.valid?
  end 
end
