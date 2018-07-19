class Product < ApplicationRecord
  BOOLEANS = [true, false].freeze

  # Validations

  validates :title, presence: true
  validates :description, presence: true
  validates :short_description, presence: true
  validates :unit_price, presence: true
  validates :icon, presence: true
  validates :in_stock, inclusion: { in: BOOLEANS }
  validates :active, inclusion: { in: BOOLEANS }

  validates_with JsonValidator, attributes: [:metadata]

  # Scopes

  scope :active, -> { where(active: true) }

  # Methods

  def effects
    if effects?
      metadata_as_json['effects']
    end
  end

  def dosage
    if dosage?
      metadata_as_json['dosage']
    end
  end

  def effects?
    metadata_as_json.has_key?('effects')
  end

  def dosage?
    metadata_as_json.has_key?('dosage')
  end

  private

    def metadata_as_json
      if metadata.present?
        JSON.parse(metadata)
      else
        {}
      end
    end
end
