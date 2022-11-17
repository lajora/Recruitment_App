class AddDefaultValueToStatusAndStage < ActiveRecord::Migration[6.1]
  def change
    change_column :job_applications, :status, :string, :default => 'pending'
    change_column :job_applications, :stage, :string, :default => 'Application recieved'
  end
end
