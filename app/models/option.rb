class Option < ApplicationRecord
  BOOLEANS = [true, false].freeze

  # Validations
  validates :open, inclusion: { in: BOOLEANS }
  validates :phone, presence: true
  validates :admin_name, presence: true
  validates :admin_password, presence: true
end
