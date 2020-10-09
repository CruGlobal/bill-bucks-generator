class BucksController < ApplicationController
  include ::Magick

  def new
    @image_params = post_params
  end

  def img
    @image_params = post_params
    img = bill_or_vonette(@image_params[:type])
    txt = Draw.new
    
    img.annotate(txt, 0,0,70,295, @image_params[:to]) do
      txt.gravity = Magick::NorthWestGravity
      txt.pointsize = 25
    end

    img.annotate(txt, 0,0,385,295, @image_params[:from]) do
      txt.gravity = Magick::NorthWestGravity
      txt.pointsize = 25
    end

    img.annotate(txt, 0,0,85,350, @image_params[:for]) do
      txt.gravity = Magick::NorthWestGravity
      txt.pointsize = 25
    end

    img.format = 'jpeg'
    send_data img.to_blob, :stream => 'false', :filename => 'test.jpg', :type => 'image/jpeg', :disposition => 'inline'
  end

  def bill_or_vonette(buck_type)
    if buck_type == "vonette"
      ImageList.new('public/vonette.png')
    else
      ImageList.new('public/bill.png')
    end
  end

  private

  def post_params
    @image_params = params.permit(:to, :from, :for, :type, :commit, :format).to_h
  end
end
