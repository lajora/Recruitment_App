class AddColumnToJobApplication < ActiveRecord::Migration[6.1]
  def change
    add_column :job_applications, :years_of_experience, :integer
    add_column :job_applications, :availability, :string
    add_column :job_applications, :salary_expectation, :float
  end
end
