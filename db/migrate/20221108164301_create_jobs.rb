class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.string :location
      t.float :salary
      t.datetime :start_date
      t.datetime :end_date
      t.float :years_of_experience
      t.string :working_hours

      t.timestamps
    end
  end
end
