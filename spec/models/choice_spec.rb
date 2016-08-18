require 'rails_helper'

RSpec.describe Choice do
  # Attributes
  it { is_expected.to have_db_column :value }

  # Validations

  # Associations
  it { is_expected.to belong_to :question }
  it { is_expected.to have_many :answers }
  it { is_expected.to have_many(:responses).through(:answers) }
end
