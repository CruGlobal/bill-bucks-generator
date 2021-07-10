# typed: strong
# This is an autogenerated file for Rails' mailers.
# Please rerun bundle exec rake rails_rbi:mailers to regenerate.
class BillMailer
  sig do
    params(
      to_name: String,
      to_email: String,
      from: String,
      for_message: String,
      count: Integer,
      from_email: T.nilable(String)
    ).returns(ActionMailer::MessageDelivery)
  end
  def self.bill(to_name:, to_email:, from:, for_message:, count: 1, from_email: nil); end
end
