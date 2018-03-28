module Datas
  class LatestDataFromDevice
    def initialize(device:)
      @device = device
    end

    def execute
      groupped_data
    end

    private
    def groupped_data
      data = {
          id: @device.id,
          name: @device.to_s,
          latitude: @device.latitude,
          longitude: @device.longitude,
          latest_data: latest_data
      }
    end

    def latest_data
      # Select values in LatestDatum where device = @device and only return variables this @device
      raw_data = LatestDatum.includes(:variable).where(device: @device)
      raw_data.map{ |datum| variable_data(datum) }
    end

    def variable_data(datum)
      {
          id: datum.variable.id,
          code: datum.variable.code,
          name: datum.variable.to_s,
          type: datum.variable.value_type,
          symbol: datum.variable.symbol,
          value: datum.value,
          timestamp: datum.timestamp.to_i
      }
    end
  end
end
