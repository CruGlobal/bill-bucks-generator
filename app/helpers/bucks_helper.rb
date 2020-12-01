module BucksHelper
  def single_note_name
    current_dept == 'irt' ? 'roman' : 'bill'
  end

  def five_note_name
    current_dept == 'irt' ? 'mary' : 'vonette'
  end

  def current_dept
    params[:dept]
  end
end
