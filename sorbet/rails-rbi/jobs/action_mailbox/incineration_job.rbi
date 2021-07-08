# typed: strong
# This is an autogenerated file for Rails' jobs.
# Please rerun bundle exec rake rails_rbi:jobs to regenerate.
class ActionMailbox::IncinerationJob
  sig { params(inbound_email: T.untyped).returns(ActionMailbox::IncinerationJob) }
  def self.perform_later(inbound_email); end

  sig { params(inbound_email: T.untyped).returns(ActionMailbox::IncinerationJob) }
  def self.perform_now(inbound_email); end

  sig do
    params(
      wait: T.nilable(ActiveSupport::Duration),
      wait_until: T.nilable(T.any(ActiveSupport::TimeWithZone, Date, Time)),
      queue: T.nilable(T.any(String, Symbol)),
      priority: T.nilable(Integer)
    ).returns(T.self_type)
  end
  def self.set(wait: nil, wait_until: nil, queue: nil, priority: nil); end
end
