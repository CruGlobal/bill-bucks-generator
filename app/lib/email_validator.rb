# typed: strict
module EmailValidator
  extend T::Sig

  sig { params(email: String).returns(T::Boolean) }
  def self.cru?(email)
    valid_suffixes = %w[@cru.org @jesusfilm.org @cru-main.slack.com]
    valid_suffixes.any? { |suffix| email.ends_with?(suffix) }
  end
end
