# typed: true
class User
  def self.build(id_token)
    new(id_token)
  end

  def initialize(id_token)
    @id_token = id_token
  end

  def name
    attributes.name
  end

  private

  def attributes
    # jwt_playload = JWT.decode(@id_token)
    # Attributes.new(name: jwt_playload[:name])
    Attributes.new('fake name')
  end

  Attributes = Struct.new(:name)
end

