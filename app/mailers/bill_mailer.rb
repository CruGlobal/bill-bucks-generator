# typed: true
class BillMailer < ApplicationMailer
  extend T::Sig

  sig do
    params(
        to_name: String,
        to_email: String,
        from: String,
        for_message: String,
        count: T.nilable(Integer),
        from_email: T.nilable(String)
      )
      .returns(Mail::Message)
  end
  def bill(to_name:, to_email:, from:, for_message:, count: 1, from_email: nil)
    @bucks =
      bucks(
        to_name: to_name,
        from: from,
        for_message: for_message,
        count: count
      )
    @bucks.each do |file_name, buck|
      attachments.inline[file_name] = buck.to_blob
    end
    mail(to: to_email, subject: "You've got Bills (Bucks)")
  end

  private

  def bucks(to_name:, from:, for_message:, count:)
    image_params = { to: to_name, from: from, for_message: for_message }
    fives = count / 5
    ones = count % 5

    vonette = Buck.new(image_params.merge(buck_type: :vonette))
    bill = Buck.new(image_params.merge(buck_type: :bill))

    i = 1
    hash = {}
    fives.times do
      hash[vonette.filename(i)] = vonette
      i += 1
    end
    ones.times do
      hash[bill.filename(i)] = bill
      i += 1
    end

    hash
  end
end
