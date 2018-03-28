class Frame < ApplicationRecord
  #relationship between models
  has_many :data

  # Include file app/admin/frame_admin.rb, this file configure model Frame in RailsAdmin
  include FrameAdmin
end
