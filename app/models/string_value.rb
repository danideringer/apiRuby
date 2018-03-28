class StringValue < ApplicationRecord
  # has_many :data, as: :value, inverse_of: :value

  def name
    value
  end
end
