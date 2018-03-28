module Api
  module V1
    class DevicesLatestDataController < ApplicationController

      def index
        devices = Devices::DeviceList.new.all # get all devices

        # map is equal to devices.each do |item|
        response = devices.map{ |device| Datas::LatestDataFromDevice.new(device: device).execute }

        render json: response, status: 200
      rescue => error
        render json: { error: "An error has occurred while request latest data, #{error.message}" }, status: 400
      end

    end
  end
end