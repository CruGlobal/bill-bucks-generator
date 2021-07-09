# typed: true
class BillMailer < ApplicationMailer
  def bill(to_name:, to_email:, from:, for_message:, count:)
    image_params = {
      to: to_name,
      from: from,
      for_message: for_message,
      buck_type: :bill
    }
    buck = Buck.new(image_params)
    attachments.inline['image.png'] = buck.to_blob
    mail(to: to_email, subject: "You've got Bills (Bucks)")
  end
end
