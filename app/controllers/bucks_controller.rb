# typed: true
class BucksController < ApplicationController
  def generate
    bill_counter if build_buck.save
    save_from_to_session

    redirect_to bucks_new_path(
                  params:
                    image_params.slice(
                      :to,
                      :from,
                      :for_message,
                      :buck_type,
                      :dept
                    )
                )
  end

  def new
    @image_params =
      { from: session[:previous_from] }.merge(image_params.symbolize_keys)
  end

  def img
    send_data build_buck.to_blob,
              filename:
                "#{number}_#{image_params[:to]}_from_#{
                  image_params[:from]
                }.png",
              type: 'image/png',
              disposition: 'inline'
  end

  private

  def build_buck
    Buck.new(image_params)
  end

  def number
    build_buck.buck_type == 'vonette' ? 5 : 1
  end

  def image_params
    @image_params ||=
      params.permit(
        :to,
        :from,
        :for_message,
        :buck_type,
        :commit,
        :format,
        :dept
      ).to_h
  end

  def bill_counter
    if session[:bill_count].nil? || new_quarter?
      session[:bill_count] = number
    else
      session[:bill_count] += number
    end

    session[:last_creation] = Date.today
  end

  def new_quarter?
    return unless session[:last_creation]

    previous_entry = session[:last_creation].to_date
    current_quarter_start = Date.today.beginning_of_quarter
    previous_entry < current_quarter_start
  end

  def save_from_to_session
    session[:previous_from] = image_params[:from]
  end
end
