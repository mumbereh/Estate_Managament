require 'httparty'

class MobilePaymentsController < ApplicationController
  def create
    payment_method = params[:payment_method]
    phone_number = params[:phone_number]
    amount = params[:amount]
    reason = params[:reason]
    pin = params[:pin]

    # Replace with actual API URLs
    airtel_api_url = 'https://api.airtel.com/v1/transaction'
    mtn_api_url = 'https://api.mtn.com/v1/transaction'

    payload = {
      phone_number: phone_number,
      amount: amount,
      reason: reason,
      pin: pin
    }

    begin
      api_url = payment_method == 'mtn' ? mtn_api_url : airtel_api_url
      response = HTTParty.post(api_url, body: payload.to_json, headers: { 'Content-Type' => 'application/json' })
      
      if response.success?
        transaction_message = response['message'] # Example: response from API
        flash[:notice] = "Payment successful: #{transaction_message}"
      else
        flash[:alert] = "Payment failed: #{response['message']}"
      end

    rescue SocketError => e
      Rails.logger.error "SocketError: #{e.message}"
      flash[:alert] = "Network error: Unable to connect to payment service."
      
    rescue StandardError => e
      Rails.logger.error "StandardError: #{e.message}"
      flash[:alert] = "An error occurred: #{e.message}"
    end

    redirect_to root_path
  end
end
