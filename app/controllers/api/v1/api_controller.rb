module Api
  module V1
    class ApiController < ApplicationController
      protect_from_forgery with: :null_session
      before_filter :check_for_valid_authtoken
      
      respond_to :json
      
      def page_not_found
        e = Error.new(status: 404, message: "Wrong URL or HTTP method")
        render json: e.to_json, status: 404
      end
      
      private   
      def check_for_valid_authtoken
        authenticate_or_request_with_http_token do |token, options|
          @user = User.where(api_authtoken: token).first
        end
      end
    end
  end
end
          
      
               