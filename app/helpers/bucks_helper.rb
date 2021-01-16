# typed: true
module BucksHelper
  def single_note_name
    current_dept == 'irt' ? 'cap' : 'bill'
  end

  def five_note_name
    current_dept == 'irt' ? 'mag' : 'vonette'
  end

  def current_dept
    params[:dept]
  end
end
