class Buck
  attr_reader :image_params

  TO_POINT_SIZE = 22
  FOR_POINT_SIZE = 25

  def initialize(image_params:)
    @image_params = image_params
  end

  def to_blob
    build_image.to_blob
  end

  private

  def build_image
    img = bill_or_vonette(image_params[:type])

    to_text = text_instance
    to_text.pointsize = TO_POINT_SIZE
    img.annotate(to_text, 0, 0, 70, 300, image_params[:to].to_s)
    img.annotate(to_text, 0, 0, 385, 300, image_params[:from].to_s)

    wrapped_for_text = fit_text(image_params[:for], 510)
    img.annotate(text_instance, 0, 0, 85, 350, wrapped_for_text)

    img.format = "png"
    img
  end

  def bill_or_vonette(buck_type)
    filename = buck_type == "vonette" ? "vonette" : "bill"
    Magick::ImageList.new("public/#{filename}.png")
  end

  def text_instance
    txt = Magick::Draw.new
    txt.pointsize = FOR_POINT_SIZE
    txt.gravity = Magick::NorthWestGravity
    txt
  end

  def text_fit?(text, width)
    tmp_image = Magick::Image.new(width, 500)
    drawing = text_instance
    drawing.annotate(tmp_image, 0, 0, 0, 0, text)
    metrics = drawing.get_multiline_type_metrics(tmp_image, text)

    metrics.width < width
  end

  def fit_text(text, width)
    return text.to_s if text.to_s.strip.blank?

    separator = " "
    line = ""

    if !text_fit?(text, width) && text.include?(separator)
      i = 0
      text.split(separator).each do |word|
        tmp_line = if i == 0
          line + word
        else
          line + separator + word
        end

        if text_fit?(tmp_line, width)
          unless i == 0
            line += separator
          end
        else
          unless i == 0
            line += '\n'
          end
        end
        line += word
        i += 1
      end
      text = line
    end
    text
  end
end
