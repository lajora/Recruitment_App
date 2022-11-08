class User < ApplicationRecord
  has_many :applications # candidate
  has_many :jobs # admin
  has_many :comments # admin

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
