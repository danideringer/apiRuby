module FrameAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'Menu'
      weight 3
    end
  end
end