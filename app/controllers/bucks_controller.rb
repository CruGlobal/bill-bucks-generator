class BucksController < ApplicationController
  extend T::Sig

  sig { void }
  def generate
    validate_email_requirements if send_email?
    redirect_to_new and return if flash[:error].present?
    send_email if send_email?

    bill_counter if build_wad.save
    save_from_to_session

    redirect_to_new
  end

  sig { void }
  def new
    @wad = build_wad
  end

  sig { void }
  def img
    send_data build_buck.to_blob,
              filename: build_buck.filename,
              type: 'image/png',
              disposition: 'inline'
  end

  private

  sig { returns(T::Boolean) }
  def send_email?
    params[:commit].to_s == 'Send Email'
  end

  sig { void }
  def redirect_to_new
    new_params = %i[to from for_message count dept to_email]
    redirect_to bucks_new_path(params: wad_params.slice(*new_params))
  end

  sig { void }
  def validate_email_requirements
    if helpers.current_user.blank?
      flash[:error] = 'You must be logged in to send emails'
    elsif !EmailValidator.cru?(wad_params[:to_email])
      flash[:error] = 'You may only send emails to Cru email addresses'
    end
  end

  sig { void }
  def send_email
    BillMailer.bill(
      buck_wad: build_wad,
      to_email: wad_params[:to_email].to_s,
      from_email: helpers.current_user.email
    ).deliver_now
    flash[:notice] = 'Email successfully sent!'
  end

  sig { returns(BuckWad) }
  def build_wad
    @wad ||=
      BuckWad.new(**wad_params.slice(:to, :from, :for_message, :count, :dept))
  end

  sig { returns(Buck) }
  def build_buck
    @buck ||= Buck.new(image_params)
  end

  sig { returns(T::Hash[Symbol, T.untyped]) }
  def wad_params
    return @wad_params if @wad_params
    @wad_params = T.let({}, T.nilable(T::Hash[Symbol, T.untyped]))
    @wad_params =
      params
        .permit(:to, :from, :for_message, :count, :commit, :dept, :to_email)
        .to_h
        .except(:commit)
        .symbolize_keys

    # maintain support for old links (since we have asked people to send us bills in the past)
    @wad_params[:count] = 5 if params[:buck_type].in?(%w[vonette mag])
    @wad_params
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
    session[:bill_count] += wad_params[:count].to_i

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
    session[:previous_from] = wad_params[:from]
  end
end
