# typed: strict
# Preview all emails at http://localhost:3000/rails/mailers/bill_mailer
class BillMailerPreview < ActionMailer::Preview
  extend T::Sig

  sig { returns(ActionMailer::MessageDelivery) }
  def bill
    BillMailer.bill(
      to_name: 'Bill',
      to_email: 'bill@cru.org',
      from: 'Vonette',
      for_message: 'Helping me learn to backflip!',
      count: 7
    )
  end
end
