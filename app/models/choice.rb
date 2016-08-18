class Choice < ApplicationRecord
  belongs_to :question
  has_many :answers
  has_many :responses, through: :answers
end
