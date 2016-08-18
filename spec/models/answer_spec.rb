require 'rails_helper'

RSpec.describe Answer, type: :model do
  # Attributes

  # Validations

  # Associations
  it { is_expected.to belong_to :choice }
  it { is_expected.to belong_to :response }
end
