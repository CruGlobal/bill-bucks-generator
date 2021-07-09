# typed: strict
module BucksHelper
  extend T::Sig

  sig { returns(String) }
  def single_note_name
    current_dept == 'irt' ? 'cap' : 'bill'
  end

  sig { returns(String) }
  def five_note_name
    current_dept == 'irt' ? 'mag' : 'vonette'
  end

  sig { returns(T.nilable(String)) }
  def current_dept
    params[:dept]
  end
end
