class BucksController < ApplicationController
  def generate
    build_buck.save
    save_from_to_session
    bill_counter
    redirect_to bucks_new_path(params: image_params.slice(:to, :from, :for_message, :buck_type))
  end

  def new
    @image_params = { from: session[:previous_from] }.merge(image_params.symbolize_keys)
  end

  def img
    send_data build_buck.to_blob,
              filename: "#{number}_#{image_params[:to]}_from_#{image_params[:from]}.png",
              type: "image/png",
              disposition: "inline"
  end

  private

  def build_buck
    Buck.new(image_params)
  end

  def number
    build_buck.buck_type == 'vonette' ? 5 : 1
  end

  def image_params
    @image_params ||= params.permit(:to, :from, :for_message, :buck_type, :commit, :format).to_h
  end

  def bill_counter
    if session[:bill_count].nil?
      session[:bill_count] = number
    else
      session[:bill_count] += number
    end
  end

  def save_from_to_session
    session[:previous_from] = image_params[:from]
  end
end
