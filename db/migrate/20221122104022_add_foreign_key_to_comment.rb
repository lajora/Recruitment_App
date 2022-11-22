class AddForeignKeyToComment < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :comments, :job_applications
  end
end
