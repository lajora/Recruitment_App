class Job < ApplicationRecord
    belongs_to :user # admin
    has_many :applications
end
