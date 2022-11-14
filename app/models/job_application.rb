class JobApplication < ApplicationRecord
    belongs_to :user
    belongs_to :job
    has_many :comments
    validates :status, inclusion: { in: %w(pending accepted rejected), 
            message: "%{value} is not a valid status" }
    validates :stage, inclusion: { in: ['Application recieved', 'Screening call', 
            "Technical test", 'Interview', 'Hired']}
end
