require 'rails_helper.rb'

RSpec.describe User do
  # Attributes
  it { is_expected.to have_db_column :email }
  it { is_expected.to have_db_column :first_name }
  it { is_expected.to have_db_column :last_name }
  it { is_expected.to have_db_column :password_digest }

  # Validations
  it { is_expected.to validate_uniqueness_of :email }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of(:password).on(:create) }
  it { is_expected.to validate_confirmation_of(:password).on(:create) }

  # Active Model
  it { is_expected.to have_secure_password }
end