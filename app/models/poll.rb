class Poll < ApplicationRecord
  belongs_to :user
  has_many :responses
  has_many :questions
end
