class BucksController < ApplicationController
  def generate
    save_from_to_session
    redirect_to bucks_new_path(params: image_params.slice(:to, :from, :for, :type))
  end

  def new
    @image_params = { from: session[:previous_from] }.merge(image_params.symbolize_keys)
  end

  def img
    buck = Buck.new(image_params: image_params)
    send_data buck.to_blob,
              filename: "#{number}_#{image_params[:to]}_from_#{image_params[:from]}.png",
              type: "image/png",
              disposition: "inline"
  end

  private

  def number
    image_params[:type] == 'vonette' ? 5 : 1
  end

  def image_params
    @image_params ||= params.permit(:to, :from, :for, :type, :commit, :format).to_h
  end

  def save_from_to_session
    session[:previous_from] = image_params[:from]
  end
end
