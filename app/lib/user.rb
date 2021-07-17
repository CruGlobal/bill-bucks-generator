# typed: true
class User
  extend T::Sig

  attr_reader :name
  attr_reader :email

  sig { params(id_token: String).returns(User) }
  def self.build(id_token)
    new(id_token)
  end

  sig { params(id_token: String).void }
  def initialize(id_token)
    @id_token = id_token
    parse_attributes_from_token
  end

  sig { returns(T::Boolean) }
  def cru?
    EmailValidator.cru?(@email)
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
