module Frames
  class ProcessedFrameAction

    def initialize(frame:, processed:)
      @frame = frame
      @processed = processed
    end

    def execute
      processed_frame
    end

    private
    def processed_frame
      @frame.update!(processed: @processed)
    end
  end
end