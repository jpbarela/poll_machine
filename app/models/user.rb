class User < ApplicationRecord
  has_secure_password

  has_many :polls

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :password, presence: true, confirmation: true, on: :create
end
