# typed: true
class BuckWad
  extend T::Sig

  attr_reader :bucks

  def initialize(to: '', from: '', for_message: '', count: 1, dept: '')
    image_params = { to: to, from: from, for_message: for_message, dept: dept }
    count = count.to_i
    number_of_vonetts = count / 5
    number_of_bills = count % 5

    vonette = Buck.new(image_params.merge(buck_type: :vonette))
    bill = Buck.new(image_params.merge(buck_type: :bill))

    @bucks = []
    number_of_vonetts.times { @bucks << vonette }
    number_of_bills.times { @bucks << bill }
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
end
