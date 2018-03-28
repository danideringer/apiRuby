class LatestDatum < ApplicationRecord
  belongs_to :device
  belongs_to :variable
  validates :device_id, uniqueness: { scope: :variable_id }
  validates :variable_id, :device_id, presence: true
end
