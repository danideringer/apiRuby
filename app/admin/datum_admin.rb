module DatumAdmin
  extend ActiveSupport::Concern

  # Show data indicate in list do, in view datum
  included do
    rails_admin do
      navigation_label 'Menu'
      weight 4
      list do
        field :id
        field :device
        field :variable
        field :value
        field :frame
        field :timestamp
      end
    end
  end
end