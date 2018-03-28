module Input
  module V1
    class DataController < ApplicationController
      # before action in def create, run function wrong_params?
      before_action :wrong_params?, only: [:create]

      # METHOD POST
      def create
        # StoreFrameAction exits in module Frame
        frame = Frames::StoreFrameAction.new(source_ip: request.remote_ip, raw: request.raw_post, device_code: params['DEVICE_CODE']).execute
        json_frame = Frames::ParseFrameAction.new(frame: frame).execute

        # ActiveRecord::Base... if occurred a error in next two sentences, execute rollback and stop
        ActiveRecord::Base.transaction do
          Datas::StoreDataAction.new(data: json_frame[:data], device_code: json_frame[:device_code], timestamp: json_frame[:timestamp], frame: frame).execute
          LatestData::StoreLatestDataAction.new(device_code: json_frame[:device_code], data: json_frame[:data], timestamp: json_frame[:timestamp]).execute
          Frames::ProcessedFrameAction.new(frame: frame, processed: true).execute
        end

        # If all transition is correct, return true and status 200
        render json: { created_frame: frame }, status: 200

        # If occurred a error in rescue => error, error.message = it was not ...
        # Similar a try cath
        rescue => error
            render json: { error: "An error has occurred while processed frame, #{ error.message }", created_frame: frame }, status: 400
      end

      private
        # Check if params of JSON is correct
        def wrong_params?
          if has_not_mandatory_params?
            render json: { message: "Wrong data params" }, status: 400
          end
        end

        # Check if params DEVICE_CODE, UTC, DATA is present in JSON send
        def has_not_mandatory_params?
          !params[:DEVICE_CODE].present? || !params[:UTC].present? || !params[:DATA].present?
        end


    end
  end
end