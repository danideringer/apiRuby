module VariableAdmin
  extend ActiveSupport::Concern

  # Show data indicate in list, edit, show, in view variable
  included do
    rails_admin do
      navigation_label 'Menu'
      weight 2
      list do
        field :code
        field :name
        field :symbol
        field :value_type
      end
      edit do
        field :code
        field :name
        field :symbol
        field :value_type
        field :devices
      end
      show do
        field :code
        field :name
        field :symbol
        field :value_type
        field :devices
      end
    end
  end
end