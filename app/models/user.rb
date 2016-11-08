class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, confirmation: true
  validates :password, length: { in: 6..20, message:'Your password must be between 6 and 20 characters' }
  has_many :speeches
end
