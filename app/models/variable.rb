class Variable < ApplicationRecord
  TYPES = %i(float string)
  #relationship between models
  # has_and_belongs_to_many relation N:M
  has_and_belongs_to_many  :devices
  has_many :data
  has_many :latest_data

  #validates
  validates :code, presence: true, uniqueness: true
  validates :value_type, presence: true

  # Include file app/admin/variable_admin.rb, this file configure model Variable in RailsAdmin
  include VariableAdmin

  # Show values( float, string) in input value_type
  enum value_type: TYPES

  def name
    code
  end

  # Read atribute name of RailsAdmin
  def to_s
    read_attribute(:name)
  end
end
