require 'rails_helper.rb'

RSpec.describe Question do
  # Attributes
  it { is_expected.to have_db_column :text }

  # Validations

  # Associations
  it { is_expected.to belong_to :poll }
  it { is_expected.to have_many :choices }
end
