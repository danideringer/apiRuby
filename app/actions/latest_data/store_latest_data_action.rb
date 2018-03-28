module LatestData
  class StoreLatestDataAction

    def initialize(device_code:, data:, timestamp:)
      @device_code = device_code
      @data = data
      @timestamp = timestamp
    end

    def execute
      device_variables.each do |variable|
        next if @data[variable.code].nil?
        find_or_create_latest_datum(variable)
      end
    end

    private
    def find_or_create_latest_datum(variable)
      # IF latest_datum_attrs(variable), exist in BD the action is create
      # else not create and update value this latest_datum_attrs(variable)
      LatestDatum.find_or_create_by!(latest_datum_attrs(variable)).update(value: @data[variable.code], timestamp: @timestamp)
    end

    def device
      @device ||= Device.find_by(code: @device_code)
    end

    def device_variables
      @device_variable ||= device.variables
    end

    def latest_datum_attrs(variable)
      {
          variable: variable,
          device: device
      }
    end
  end
end