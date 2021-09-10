# typed: true
class BillMailer < ApplicationMailer
  extend T::Sig

  sig do
    params(buck_wad: BuckWad, to_email: String, from_email: String)
      .returns(Mail::Message)
  end
  def bill(buck_wad:, to_email:, from_email:)
    @buck_wad = buck_wad
    bucks = buck_wad.bucks_by_filename
    bucks.each do |file_name, buck|
      attachments.inline[file_name] = buck.to_blob
    end
    @from_email = from_email
    mail(to: to_email, reply_to: from_email, subject: subject(buck_wad))
  end

  private

  sig { params(buck_wad: BuckWad).returns(String) }
  def subject(buck_wad)
    "Enclosed: Bill Bucks from #{buck_wad.from}! 🅱️💌"
  end
end
