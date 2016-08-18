class Response < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :poll
  has_many :answers
  has_many :choices, through: :answers
end
