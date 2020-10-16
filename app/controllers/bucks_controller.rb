class BucksController < ApplicationController
  def new
    image_params
  end

  def img
    buck = Buck.new(image_params: image_params)
    send_data buck.to_blob, filename: "test.png", type: "image/png", disposition: "inline"
  end

  private

  def image_params
    @image_params ||= params.permit(:to, :from, :for, :type, :commit, :format).to_h
  end
end
