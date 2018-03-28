module Frames
  # Action for work with frames, created only frame without variables
  # variables save in ParseFrameAction
  class StoreFrameAction
    # Constructor
    def initialize (source_ip:, raw:, device_code:)
      @source_ip = source_ip
      @raw = raw
      @device_code = device_code
    end

    # After created def initialize, always created def execute because run initialize after run execute
    def execute
      # if device exists, created frame with params of function frame_attrs and save in BD
      raise StandardError, 'device not found' unless device
      Frame.create!(frame_attrs)
    end

    private
      # created frame with params and return JSON with variable a object type frame
      def frame_attrs
        {
            raw: @raw,
            source_ip: @source_ip,
            timestamp: Time.now,
            processed: false
        }
      end

      # get device find by code
      def device
        Device.find_by(code: @device_code)
      end
  end
end