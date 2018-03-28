module Devices
  class UpdateLastFrameAction
    # Update last frame
    def initialize(device_code:, frame:)
      @device_code = device_code
      @frame = frame
    end

    def execute
      update_last_frame
    end

    private
    def update_last_frame
      device.update!(last_frame_id: @frame.id, last_frame_at: @frame.timestamp)
    end

    def device
      @device ||= Device.find_by(code: @device_code)
    end
  end
end