module Datas
  class StoreDataAction

    def initialize(data:, device_code:, timestamp:, frame:)
      @timestamp = timestamp
      @device_code = device_code
      @data = data
      @frame = frame
    end

    def execute
      # Recorremos las variables del dispositivo y extraemos su code, consultamos en el data con ese code y
      # creamos el data
      device_variables.each do |variable|
        next if @data[variable.code].nil?
        Datum.create!(datum_attrs(variable, @data[variable.code]))
      end
    end

    private
    def device
      #   Devuelve el device por code
      @device ||= Device.find_by(code: @device_code)
    end

    def device_variables
      # devuelve las variables de un device. Se puede acceder a partir del objecto device.variables
      @device_variables ||= device.variables
    end

    def value(value, type)
      # usamos un case para definir si el valor que tenemos que insertar es float o string. Este valor lo extraemos de la variable
      case type
        when 'float'
          FloatValue.create!(value: value)
        when 'string'
          StringValue.create!(value: value)
      end
    end

    def frame_has_any_variable?
      # comprobamos si los devices_variables tienen algun code dentro del data
      device_variables.pluck(:code).any? { |k| @data.key?(k) }
    end

    def datum_attrs(variable, value)
      # devuelve los atributos de datum para poder crearlo
      {
          timestamp: @timestamp,
          device: device,
          frame: @frame,
          variable: variable,
          value: value(value, variable.value_type)
      }
    end

  end
end