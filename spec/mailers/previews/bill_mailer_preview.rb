# Preview all emails at http://localhost:3000/rails/mailers/bill_mailer
class BillMailerPreview < ActionMailer::Preview
  def bill
    BillMailer.bill(
      buck_wad:
        BuckWad.new(
          to: 'Bill',
          from: 'Vonette',
          for_message: ('Being Awesome! ' * 6),
          count: 13
        ),
      to_email: 'bill@cru.org',
      from_email: 'vonette@cru.org'
    )
  end
end
