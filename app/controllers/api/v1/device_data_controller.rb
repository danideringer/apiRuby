module Api
  module V1
    class DeviceDataController < ApplicationController

      def show
        response = Datas::DataFromDevice.new(allowed_params).execute
        render json: response, status: 200
      rescue => error
        render json: { error: "An error has occurred while request latest data, #{error.message}" }, status: 400
      end

      private
      def allowed_params
        {
            device_id: params[:id],
            from: params[:from],
            to: params[:to],
        }
      end

    end
  end
end