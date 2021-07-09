# typed: true
class User
  extend T::Sig

  attr_reader :name
  attr_reader :email

  def self.build(id_token)
    new(id_token)
  end

  def initialize(id_token)
    @id_token = id_token
    parse_attributes_from_token
  end

  sig { returns(T::Boolean) }
  def cru?
    valid_suffixes = %w[@cru.org @jesusfilm.org]
    valid_suffixes.any? { |suffix| @email.ends_with?(suffix) }
  end

  private

  def parse_attributes_from_token
    # a JWT (token) is a three-segment string.
    payload_segment = @id_token.split('.')[1].to_s

    # The middle segment is a base64 encoded json payload.
    decoded_json_text = Base64.urlsafe_decode64(payload_segment)
    jwt_json = JSON.parse(decoded_json_text, symbolize_names: true)

    @name = jwt_json[:name]
    @email = jwt_json[:preferred_username]
  end
end