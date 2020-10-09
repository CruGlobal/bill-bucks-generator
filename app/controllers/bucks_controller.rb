require 'rmagick'

class BucksController < ApplicationController
  include ::Magick

  def new
    @image_params = params.permit(:to, :from, :for, :type, :commit).to_h
  end

  def img
    img = ImageList.new('public/bill.png')
    txt = Draw.new

    img.annotate(txt, 0,0,70,300, "Spencer Oberstadt test") do
      txt.gravity = Magick::NorthWestGravity
      txt.pointsize = 25
      txt.stroke = '#000000'
      txt.fill = '#ffffff'
      txt.font_weight = Magick::BoldWeight
    end

    img.format = 'jpeg'
    send_data img.to_blob, :stream => 'false', :filename => 'test.jpg', :type => 'image/jpeg', :disposition => 'inline'
  end
end
