class JobApplication < ApplicationRecord
    belongs_to :user
    belongs_to :job
    has_many :comments
    has_attached_file :document
    validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
    validates :status, inclusion: { in: %w(pending accepted rejected), 
            message: "%{value} is not a valid status" }
    validates :stage, inclusion: { in: ['Application recieved', 'Screening call', 
            "Technical test", 'Interview', 'Second Interview', 'Hired']}

        def next_stage
                case self.stage
                when 'Application recieved'
                        'Screening call'
                when 'Screening call'
                        "Technical test"
                when 'Technical test'
                        'Interview'
                when 'Interview'
                        'Second Interview'
                when 'Second Interview'
                        'Hired'
                end
        end

        def previous_stage
                case self.stage
                
                when 'Hired'
                        'Second Interview'
                when 'Second Interview'
                        "Interview"
                when 'Interview'
                        'Technical test'
                when 'Technical test'
                        'Screening call'
                when 'Screening call'
                        'Application recieved'
                end
        end

        def reject_application
                self.status = 'rejected'
        end
end
