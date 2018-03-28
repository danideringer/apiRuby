module Devices
  class DeviceList
    def initialize
      @devices = Device.all
    end

    def all
      @devices
    end
  end
end
