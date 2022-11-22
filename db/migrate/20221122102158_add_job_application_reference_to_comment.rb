class AddJobApplicationReferenceToComment < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :job_application, index: true
  end
end
