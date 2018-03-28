class Datum < ApplicationRecord
  #relationship between models
  belongs_to :variable
  belongs_to :device
  belongs_to :frame

  #relationship polymorphic (the name value), value = relationship with model string_value and float_value
  belongs_to :value, polymorphic: true, dependent: :destroy

  #validates
  validates :timestamp, uniqueness: { scope: [:device_id, :variable_id] }

  # Include file app/admin/datum_admin.rb, this file configure model Datum in RailsAdmin
  include DatumAdmin

  def name
    value.value
  end
end
