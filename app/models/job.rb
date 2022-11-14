class Job < ApplicationRecord
    belongs_to :user # admin
    has_many :job_applications
    has_many :users, through: :job_applications
end
