class Remark < ApplicationRecord
  belongs_to :job_application
  belongs_to :user
  validates :content, presence: true
end
