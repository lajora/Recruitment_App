class User < ApplicationRecord
  has_many :job_applications # candidate
  has_many :jobs # admin
  has_many :comments # admin

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save {self.email = email.downcase }
  validates :first_name, presence: true, length: { maximum: 50 }  
  validates :last_name, presence: true, length: { maximum: 50 }      
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true 
end
