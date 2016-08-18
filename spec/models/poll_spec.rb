require 'rails_helper.rb'

RSpec.describe Poll do
  # Attributes
  it { is_expected.to have_db_column :name }

  # Validations

  # Associations
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :questions }
  it { is_expected.to have_many :responses }
end
