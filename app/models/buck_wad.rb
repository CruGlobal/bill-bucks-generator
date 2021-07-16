# typed: strict
class BuckWad
  extend T::Sig

  sig { returns(T::Array[Buck]) }
  attr_reader :bucks

  sig do
    params(
      to: T.nilable(String),
      from: T.nilable(String),
      for_message: T.nilable(String),
      count: T.nilable(Integer),
      dept: T.nilable(String)
    ).void
  end
  def initialize(to: '', from: '', for_message: '', count: 1, dept: '')
    image_params = { to: to, from: from, for_message: for_message, dept: dept }
    count = count.to_i
    number_of_vonetts = count / 5
    number_of_bills = count % 5

    @bucks = T.let([], T::Array[Buck])
    number_of_vonetts.times do
      @bucks << Buck.new(image_params.merge(buck_type: :vonette))
    end
    number_of_bills.times do
      @bucks << Buck.new(image_params.merge(buck_type: :bill))
    end
    add_pagination
  end

  sig { returns(T::Boolean) }
  def save
    bucks.all?(&:save)
  end

  sig { returns(T::Hash[String, Buck]) }
  def bucks_by_filename
    hash = {}
    @bucks.each_with_index { |buck, i| hash[buck.filename(i)] = buck }
    hash
  end

  private

  sig { void }
  def add_pagination
    return unless @bucks.many?

    @bucks.each_with_index do |buck, i|
      buck.for_message = "#{buck.for_message} (#{i + 1}/#{@bucks.count})"
    end
  end
end
