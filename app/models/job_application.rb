class JobApplication < ApplicationRecord
    belongs_to :user
    belongs_to :job
    has_many :comments
    has_attached_file :document
    validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
    validates :status, inclusion: { in: %w(pending accepted rejected), 
            message: "%{value} is not a valid status" }
    validates :stage, inclusion: { in: ['Application recieved', 'Screening call', 
            "Technical test", 'Interview', 'Hired']}
end
