class RemoveJobApplicationFromComment < ActiveRecord::Migration[6.1]
  def change
    remove_reference :comments, :job_application, null: false, foreign_key: true
  end
end
