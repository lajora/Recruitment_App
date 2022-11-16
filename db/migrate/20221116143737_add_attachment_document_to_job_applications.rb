class AddAttachmentDocumentToJobApplications < ActiveRecord::Migration[4.2]
  def self.up
    change_table :job_applications do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :job_applications, :document
  end
end
