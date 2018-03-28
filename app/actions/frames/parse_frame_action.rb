module Frames
  class ParseFrameAction
    # Constructor
    def initialize(frame:)
      @frame = frame
    end

    def execute
      {
          device_code: device_code,
          timestamp: utc,
          data: frame_data
      }
    end

    private
      def data
        # use ||= for, if @data is nil, execute JSON.parse else no execute JSON.parse
        @data ||= JSON.parse(@frame.raw)

        # if JSON.parse generate error, return error
        rescue
          raise StandardError, 'it was not possible to parse frame'
      end

      def device_code
        # return value DEVICE_CODE of return function data
        data['DEVICE_CODE']
      end

      def utc
        # return value UTC of return function data
        Time.at(data['UTC'])
      end

      def frame_data
        # return value DATA of return function data
        data['DATA']
      end
  end
end