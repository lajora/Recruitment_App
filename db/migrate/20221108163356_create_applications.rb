class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.string :status
      t.string :stage

      t.timestamps
    end
  end
end
