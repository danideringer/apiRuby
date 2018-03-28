module Datas
  class DataFromDevice

    def initialize(device_id:, from: nil, to: nil)
      @device_id = device_id
      @from =  from || (Time.now - 7.days).to_i
      @to = to || Time.now.to_i
      @query = Datum.all
    end

    def execute
      filter_by_device_and_variable
      include_value_and_variable
      include_from_and_to
      groupped_data
    end

    private
    def groupped_data
      data = raw_data
      response = base_response
      data.each do |variable_id, data|
        variable_data = base_variable_data(data.sample.variable)
        variable_data[:values] = data.map { |datum| { timestamp: datum.timestamp.to_i, value: datum.value.value } }
        response[:data] << variable_data
      end
      response
    end

    def base_response
      {
          id: device.id,
          name: device.to_s,
          latitude: device.latitude,
          longitude: device.longitude,
          data: []
      }
    end

    def base_variable_data(variable)
      {
          id: variable.id,
          name: variable.to_s,
          type: variable.value_type,
          symbol: variable.symbol,
          values: []
      }
    end

    def raw_data
      @query.all.group_by(&:variable_id)
    end

    def variable_ids
      device.variables.pluck(:id)
    end

    def device
      @device ||= Device.find(@device_id)
    end

    def filter_by_device_and_variable
      @query = @query.where(device: @device_id, variable: variable_ids)
    end

    def include_value_and_variable
      @query = @query.includes(:variable, :value)
    end

    def include_from_and_to
      @query = @query.where('timestamp >= ?', Time.at(@from.to_i))
      @query = @query.where('timestamp <= ?', Time.at(@to.to_i))
    end

  end
end