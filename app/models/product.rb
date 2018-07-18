class Product < ApplicationRecord
  BOOLEANS = [true, false].freeze

  belongs_to :category

  # Validations
  validates :title, presence: true
  validates :description, presence: true
  validates :short_description, presence: true
  validates :unit_price_in_cents, presence: true
  validates :in_stock, presence: true
  validates :icon, presence: true
  validates :active, inclusion: { in: BOOLEANS }

  validates_with JsonValidator, attributes: [:metadata]

  # Attributes
  attribute :unit_price_in_cents, :integer, default: 0

  # Scopes
  scope :active, -> { where(active: true) }

  def unit_price
    self.unit_price_in_cents.to_f / 100
  end

  def unit_price=(price)
    self.unit_price_in_cents = price.to_f * 100
  end

  def gif?
    gif.present?
  end

  def effects?
    metadata_as_json.has_key?('effects')
  end

  def dosage_info?
    metadata_as_json.has_key?('dosage_info')
  end

  def effects
    if effects?
      metadata_as_json['effects']
    end
  end

  def dosage_info
    if dosage_info?
      metadata_as_json['dosage_info']
    end
  end

  def dosage_bowls
    if dosage_info?
      dosage_info['bowls']
    end
  end

  def dosage_joints
    if dosage_info?
      dosage_info['joints']
    end
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
