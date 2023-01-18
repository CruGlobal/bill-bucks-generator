module EmailValidator
  def self.cru?(email)
    valid_suffixes = %w[
      @cru.org
      @jesusfilm.org
      @cru-main.slack.com
      @athletesinaction.org
    ]
    valid_suffixes.any? { |suffix| email.ends_with?(suffix) }
  end
end
