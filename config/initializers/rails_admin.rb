require Rails.root.join('lib', 'rails_admin', 'reprocess_frame.rb')
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::ReprocessFrame)

RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  # Change name backend RailsAdmin
  config.main_app_name = ['IoT API']

  # Show only models [Device, Variable, Frame, Datum] in Rails Admin
  config.included_models += %w(Device Variable Frame Datum)

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
        except ['Datum', 'Frame'] # Disable action new in Datum and Frame
    end
    export
    bulk_delete
    show
    edit do
        except ['Datum', 'Frame'] # Disable action edit in Datum and Frame
     end
    delete do
        except ['Datum', 'Frame'] # Disable action delete in Datum and Frame
    end
    show_in_app
    reprocess_frame

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
