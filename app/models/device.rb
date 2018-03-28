class Device < ApplicationRecord
  #relationship between models
  # has_and_belongs_to_many relation N:M
  has_and_belongs_to_many  :variables
  has_many :data
  has_many :latest_data

  #validates
  validates :code, presence: true, uniqueness: true

  # Include file app/admin/device_admin.rb, this file configure model Device in RailsAdmin
  include DeviceAdmin

  def name
    code
  end

  def location
    "#{latitude}, #{longitude}"
  end

  # Read atribute name of RailsAdmin
  def to_s
    read_attribute(:name)
  end
end
