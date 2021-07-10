# typed: strict
class BucksController < ApplicationController
  extend T::Sig

  sig { void }
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

  sig { void }
  def new
    @image_params =
      { from: session[:previous_from] }.merge(image_params.symbolize_keys)
  end

  sig { void }
  def img
    send_data build_buck.to_blob,
              filename: build_buck.filename,
              type: 'image/png',
              disposition: 'inline'
  end

  private

  sig { returns(Buck) }
  def build_buck
    Buck.new(image_params)
  end

  sig { returns(T::Hash[T.untyped, T.untyped]) }
  def image_params
    return @image_params if @image_params
    @image_params = T.let({}, T.nilable(T::Hash[T.untyped, T.untyped]))
    @image_params =
      params
        .permit(:to, :from, :for_message, :buck_type, :commit, :format, :dept)
        .to_h
        .except(:commit, :format)
  end

  sig { void }
  def bill_counter
    session[:bill_count] = 0 if session[:bill_count].nil? || new_quarter?
    session[:bill_count] += build_buck.number

    session[:last_creation] = Date.today
  end

  sig { returns(T::Boolean) }
  def new_quarter?
    return false unless session[:last_creation]

    previous_entry = session[:last_creation].to_date
    current_quarter_start = Date.today.beginning_of_quarter
    previous_entry < current_quarter_start
  end

  sig { void }
  def save_from_to_session
    session[:previous_from] = image_params[:from]
  end
end
