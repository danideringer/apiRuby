module RailsAdmin
  module Config
    module Actions
      class ReprocessFrame < RailsAdmin::Config::Actions::Base

        register_instance_option :visible? do
          authorized? && bindings[:object].class == Frame
        end

        register_instance_option :member do
          true
        end

        register_instance_option :link_icon do
          'icon-repeat'
        end

        register_instance_option :pjax? do
          false
        end

        register_instance_option :controller do
          proc do
            puts '****************'
            puts '****************'
            puts '****************'
            puts @object.id
            puts '****************'
            puts '****************'
            puts '****************'
            #   Llamada a reprocesar trama
          end
        end

      end
    end
  end
end