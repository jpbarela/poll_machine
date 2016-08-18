require 'rails_helper'

RSpec.describe Response do
  # Attributes

  # Validations

  # Associations
  it { is_expected.to belong_to :user}
  it { is_expected.to belong_to :poll }
  it { is_expected.to have_many :answers }
  it { is_expected.to have_many(:choices).through(:answers) }
end
