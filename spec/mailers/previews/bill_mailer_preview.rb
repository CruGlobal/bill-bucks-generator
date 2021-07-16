# typed: strict
# Preview all emails at http://localhost:3000/rails/mailers/bill_mailer
class BillMailerPreview < ActionMailer::Preview
  extend T::Sig

  sig { returns(ActionMailer::MessageDelivery) }
  def bill
    BillMailer.bill(
      buck_wad:
        BuckWad.new(
          to: 'Bill',
          from: 'Vonette',
          for_message: 'Being Awesome!',
          count: 13
        ),
      to_email: 'bill@cru.org',
      from_email: 'vonette@cru.org'
    )
  end
end
