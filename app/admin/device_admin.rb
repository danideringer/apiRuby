module DeviceAdmin
  extend ActiveSupport::Concern

  # Show data indicate in list, edit, show, in view device
  included do
    rails_admin do
      navigation_label 'Menu'
      weight 1
      list do
        field :code
        field :name
        field :variables
        field :last_frame_id
        field :last_frame_at
      end
      edit do
        field :code
        field :name
        field :variables
        field :latitude
        field :longitude
      end
      show do
        field :code
        field :name
        field :variables
        field :location # :location = method in models/device
        field :last_frame_id
        field :last_frame_at
      end
    end
  end
end