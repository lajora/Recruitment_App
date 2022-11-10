class Job < ApplicationRecord
    belongs_to :user # admin
    has_many :job_applications
end
