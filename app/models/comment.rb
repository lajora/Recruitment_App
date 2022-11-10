class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :job_application
    validates :content, presence: true
end
